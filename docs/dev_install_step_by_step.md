* \# TTD: install math; migrate to config; install; run scripts.
1. \# Install ubuntu 18.04 minimal desktop on a virtual machine.
1. \# You can go step by step, or, if you are feeling lucky, you can copy and paste this whole readme from a browser into a terminal. 
1. \# Set environmental variables to be used below:
     * `POLIS_DATABASE_PASSWORD="postgres"`
     * `POLIS_DATABASE="polis-dev"`
     * `NVM_VERSION="v0.35.3"` # visit https://github.com/nvm-sh/nvm to confirm the latest version
     * `POLIS_HOME="$HOME"`
     * `POLIS_REPO="polisCode"`
     * `LOG_DIRECTORY="logs"`
     * `USER_BIN_DIRECTORY=${HOME}/bin`
     * `GIT_HOME="https://github.com/pol-is-trial-balloon"`
     * `GIT_BRANCH="crkrenn-dev-install-1"`
1. \# Install git; clone repo
     * `sudo apt update; sudo apt install -y git`
     * `cd $POLIS_HOME`
     * `git clone ${GIT_HOME}/${POLIS_REPO}.git`
     * `cd ${POLIS_HOME}/${POLIS_REPO}`
     * `git checkout $GIT_BRANCH`
1. \# Install necessary apt packages
     * `sudo apt update`
     * `sudo apt install -y postgresql`
     * `sudo apt install -y postgresql-contrib`
     * `sudo apt install -y postgresql-client`
     * `sudo apt install -y postgresql-server-dev-all`
     * `sudo apt install -y npm`
     * `sudo apt install -y curl`
     * `sudo apt install -y python` 
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
1. \# Compile node components
     * `echo "building server"`
     * `cd ${POLIS_HOME}/${POLIS_REPO}/server`
     * ``bash -i -c "nvm use `node ./bin/printNodeVersion`; npm install"``
     * `echo "building clientAdmin"`
     * `cd ${POLIS_HOME}/${POLIS_REPO}/clientAdmin`
     * ``bash -i -c "nvm use `node ./bin/printNodeVersion`; npm install"``
     * `echo "building clientParticipation"`
     * `cd ${POLIS_HOME}/${POLIS_REPO}/clientParticipation`
     * ``bash -i -c "nvm use `node ./bin/printNodeVersion`; npm install --global bower"``
     * ``bash -i -c "nvm use `node ./bin/printNodeVersion`; npm install"``
     * ``bash -i -c "nvm use `node ./bin/printNodeVersion`; bower install"``
1. \# Install Leiningen (clojure)
     * `mkdir $USER_BIN_DIRECTORY`
     * `curl --output ${USER_BIN_DIRECTORY}/lein https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein`
     * `chmod u+x ${USER_BIN_DIRECTORY}/lein`
1. \#Compile math (clojure)
     * `echo "building math"`
     * `cd ${POLIS_HOME}/${POLIS_REPO}/math`
     * `${USER_BIN_DIRECTORY}/lein deps`
1. \# Finished!

