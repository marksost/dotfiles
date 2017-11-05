#!/usr/bin/env bash

# NOTE: Make sure XCode (CLI tools) is installed before running this script

# Install brew if needed
if ! hash brew &> /dev/null; then
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Ensure brew is up to date
brew update

# Upgrade any installed packages
brew upgrade

# Install GPG
brew install gpg

# Install RVM before installing other binaries
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -sSL https://get.rvm.io | bash -s stable --ruby
rvm install 2.3.0
rvm use 2.3.0

# Install more recent versions of some macOS tools.
brew install vim --override-system-vi
brew install homebrew/dupes/grep
brew install homebrew/dupes/openssh
brew install homebrew/dupes/screen

# Install PHP and utilities
brew install homebrew/php/php70
brew install homebrew/php/php70-xdebug
brew install homebrew/php/phplint
brew install composer

# Install standard binaries
brew install node
brew install go
brew install ansible
brew install fleetctl
brew install jq
brew install redis

# Install IT tools
brew install pv
brew install siege

# Install MySQL
brew install mysql

# Install NPM packages
npm install -g jshint bower grunt-cli

# Install gems
gem install travis

# Get and install PIP
cd /tmp
curl -O https://bootstrap.pypa.io/get-pip.py
python get-pip.py

# Install PIP utilities
pip install --upgrade pip setuptools
pip install awscli
pip install virtualenv
pip install virtualenvwrapper

# Install Deis utilities
cd /usr/local/bin/
curl -sSL http://deis.io/deisctl/install.sh | sh -s 1.13.3
curl -sSL http://deis.io/deis-cli/install.sh | sh
