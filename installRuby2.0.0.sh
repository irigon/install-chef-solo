#!/bin/bash

function apt-install {
	sudo apt-get install $1
	if [ $? -ne 0 ]; then
		echo "Package $1 could not be installed. Exiting..."
		exit -1
	fi
}

apt-install curl
\curl -sSL https://get.rvm.io | bash -s stable --ruby=2.0.0
#source $HOME/.rvm/scripts/rvm
#rvm get stable
#rvm pkg install openssl
#rvm install ruby-2.0.0
#rvm use --default 2.0.0
