terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

# Set the variable value in *.tfvars file
# or using -var="do_token=..." CLI option
# or export TF_VAR_do_token= 
variable "do_token" {}

# Configure the DigitalOcean Provider
provider "digitalocean" {
  token = var.do_token
}

# Create a new SSH key
resource "digitalocean_ssh_key" "default" {
  name       = "Terraform Example"
  public_key = file("~/.ssh/id_rsa.pub")
}

# Create a new polis Droplet in the sfo3 region
resource "digitalocean_droplet" "polis" {
  image  = "ubuntu-18-04-x64"
  name   = "polis"
  region = "sfo3"
  size   = "s-1vcpu-2gb"
  ssh_keys = [digitalocean_ssh_key.default.fingerprint]
  
    connection {
    host = self.ipv4_address
    user = "root"
    type = "ssh"
    # private_key = file(var.pvt_key)
    timeout = "2m"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt update",
      "git clone https://github.com/compdemocracy/polis.",
      "sudo apt-get install     apt-transport-https     ca-certificates     curl     gnupg     lsb-release -y",
      "echo   \"deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable\" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null",
      "sudo apt-get update",
      "curl -L \"https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)\" -o /usr/local/bin/docker-compose",
      "sudo chmod +x /usr/local/bin/docker-compose",
      "cd polis",
      "docker-compose up --build -d"
      
      # "export PATH=$PATH:/usr/bin",
      # # install nginx
      # "sudo apt update",
      # "sudo apt install -y nginx"
    ]
  }
}

resource "digitalocean_floating_ip" "polis" {
  droplet_id = digitalocean_droplet.polis.id
  region     = digitalocean_droplet.polis.region
}

output "fixed_ip" {
  value = digitalocean_floating_ip.polis.ip_address
  }

resource "digitalocean_project" "polis" {
  name        = "polis"
  resources   = [digitalocean_droplet.polis.urn]
}

# resource "digitalocean_domain" "default" {
#   name = "algorithmicdemocracy.org"
# }

# Add an A record to the domain for www.example.com.
# resource "digitalocean_record" "polis" {
#   domain = digitalocean_domain.default.name
#   type   = "A"
#   name   = "polis"
#   value  = digitalocean_floating_ip.polis.ip_address
# }