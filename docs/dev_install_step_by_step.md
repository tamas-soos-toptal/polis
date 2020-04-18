1. Install ubuntu 18.04 minimal desktop on a virtual machine.
1. Install git; clone polisCode repo
     * `sudo apt update; sudo apt install -y git`
     * `git clone https://github.com/pol-is-trial-balloon/polisCode.git`
1. Set environmental variables to be used below:
     * `POLIS_DATABASE_PASSWORD="postgres"`
     * `POLIS_DATABASE="polis-dev"`
     * `NVM_VERSION="v0.34.0"`
1. Install necessary apt packages
     * `sudo apt update`
     * `sudo apt install -y postgresql`
     * `sudo apt install -y postgresql-contrib`
     * `sudo apt install -y postgresql-server-dev-all`
     * `sudo apt install -y npm`
1. Open polis dev_install_step_by_step jupyter notebook:
     * `jupyter lab dev_install_step_by_step.ipynb  &`

