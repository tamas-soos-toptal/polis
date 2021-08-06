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

# Create a new polis Droplet in the sfo3 region
resource "digitalocean_droplet" "polis" {
  image  = "ubuntu-18-04-x64"
  name   = "polis"
  region = "sfo3"
  size   = "s-1vcpu-2gb"
}

resource "digitalocean_floating_ip" "polis" {
  droplet_id = digitalocean_droplet.polis.id
  region     = digitalocean_droplet.polis.region
}

resource "digitalocean_project" "polis" {
  name        = "polis"
  resources   = [digitalocean_droplet.polis.urn]
}

resource "digitalocean_domain" "default" {
  name = "algorithmicdemocracy.org"
}

# Add an A record to the domain for www.example.com.
resource "digitalocean_record" "polis" {
  domain = digitalocean_domain.default.name
  type   = "A"
  name   = "polis"
  value  = digitalocean_floating_ip.polis.ip_address
}