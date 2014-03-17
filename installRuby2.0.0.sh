#!/bin/bash

function apt-install {
	sudo apt-get install $1
	[[ $? -ne 0 ]] && echo "Package $1 could not be installed. Exiting..." && exit -1
}

# Check if a package is already installed
#function check_package {

#}

apt-install curl
\curl -sSL https://get.rvm.io | bash -s stable --ruby=2.0.0
source $HOME/.rvm/scripts/rvm
rvm install ruby-2.0.0
rvm use --default 2.0.0
gem update --no-rdoc --no-ri
gem install ohai chef --no-rdoc --no-ri
