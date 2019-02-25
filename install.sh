#!/usr/bin/env bash

source ./bootstrap.sh

source ./brew.sh

source ${HOME}/.bash_profile

# install WP-CLI
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x wp-cli.phar && sudo mv wp-cli.phar /usr/local/bin/wp


# install NVM
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | PROFILE=${HOME}/.nvm_profile bash

source ${HOME}/.bash_profile

nvm install 6
nvm alias default 6

brew install yarn --without-node
npm install -g grunt-cli

pear install PHP_CodeSniffer