* TTD: remove unneccesary environment variables; contintue with px script
1. \# Install ubuntu 18.04 minimal desktop on a virtual machine.
1. \# Install git; clone polisCode repo
     * `sudo apt update; sudo apt install -y git`
     * `git clone https://github.com/pol-is-trial-balloon/polisCode.git`
1. \# Set environmental variables to be used below:
     * `POLIS_DATABASE_PASSWORD="postgres"`
     * `POLIS_DATABASE="polis-dev"`
     * `NVM_VERSION="v0.35.3"` # visit https://github.com/nvm-sh/nvm to confirm the latest version
1. \# Install necessary apt packages
     * `sudo apt update`
     * `sudo apt install -y postgresql`
     * `sudo apt install -y postgresql-contrib`
     * `sudo apt install -y postgresql-server-dev-all`
     * `sudo apt install -y npm`
     * `sudo apt install -y curl`
1. \# Install additional (non-apt) packages
     * `curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/${NVM_VERSION}/install.sh | bash`
1. \# Verify the current versions of node
     * `cd polisCode`
     * `grep -e '"node"' */package.json`
1. \# Install the necessary versions of node:
     * `bash -i -c "nvm install 6.2.0"`
     * `bash -i -c "nvm install 6.9.1"`
     * `bash -i -c "nvm install 6.10.3"`
     * `bash -i -c "nvm install 10.9.0"`
1. \# Create polis database & set password
     * `sudo -u postgres createdb $POLIS_DATABASE`
     * `sudo -u postgres psql -d $POLIS_DATABASE -c "ALTER USER postgres WITH PASSWORD '$POLIS_DATABASE_PASSWORD';"`


