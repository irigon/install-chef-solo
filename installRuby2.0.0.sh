#!/bin/bash

function apt-install {
	sudo apt-get install $1
	[[ $? -ne 0 ]] && echo "Package $1 could not be installed. Exiting..." && exit -1
}

# No ruby package should be installed with apt-get or similar
function sanity_check {
	declare -a ruby_progs=('chef' 'rubygems' 'ohai');
	for i in ${ruby_progs[@]}; do  
		type $i >/dev/null 2>&1 && { echo >&2 "Uninstall $i and proceed. Aborting."; exit 1; }
	done
}

# Verify if any ruby program was installed with apt-get
sanity_check

# install curl if not installed and with it install rvm (ruby versioning)
apt-install curl
\curl -sSL https://get.rvm.io | bash -s stable --ruby=2.0.0
source $HOME/.rvm/scripts/rvm

# install ruby 2.0.0
rvm install ruby-2.0.0
rvm use --default 2.0.0

# install chef
gem update --no-rdoc --no-ri
gem install ohai chef --no-rdoc --no-ri

# run cookbooks
