1. Install ubuntu 18.04 minimal desktop on a virtual machine.
1. Install git; clone polisCode repo
     * `sudo apt update; sudo apt install -y git`
     * `git clone https://github.com/pol-is-trial-balloon/polisCode.git`
1. Set environmental variables to be used below:
     * `POLIS_DATABASE_PASSWORD="postgres"`
     * `POLIS_DATABASE="polis-dev"`
     * `NVM_VERSION="v0.35.3"`


#POLIS_DATABASE="polis"
POLIS_DATABASE="polis-dev"
#Note: database user is hardcoded as "postgres"
POLIS_HOME="$HOME/polis_root/dgpsp_update"
POLIS_SOURCE_HOME="$HOME/polis_root/source_Common"
POLIS_LOGS="$POLIS_HOME/logs"
GIT_HOME="https://github.com/pol-is"
GIT_BRANCH="master"
GIT_BRANCH="aws_4_22_19"
POLIS_COMMON="dgpspCommon"
POLIS_SERVER="polisServer"
POLIS_CLIENT_PARTICIPATION="polisClientParticipation"
POLIS_CLIENT_ADMIN="polisClientAdmin"
POLIS_MATH="polisMath"
CACHE_GIT_CREDS="1"
NVM_VERSION="v0.34.0"
POLIS_SHELL_DEBUG="0"
HEROKU_LOCAL="0"
POLIS_KEEP_LOGS="0"

1. Install necessary apt packages
     * `sudo apt update`
     * `sudo apt install -y postgresql`
     * `sudo apt install -y postgresql-contrib`
     * `sudo apt install -y postgresql-server-dev-all`
     * `sudo apt install -y npm`
1. Open polis dev_install_step_by_step jupyter notebook:
     * `jupyter lab dev_install_step_by_step.ipynb  &`

