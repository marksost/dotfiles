#!/usr/bin/env bash

# Install RVM before installing other binaries
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -sSL https://get.rvm.io | bash -s stable --ruby
rvm install 2.4.1
rvm use 2.4.1

# Install brew packages
# for FORMULA in $(cat "./brew/formula-list.txt"); do
#   brew install "${FORMULA}"
# done

# Install NPM packages
npm install -g eslint jshint bower grunt-cli

# Install gems
gem install github_changelog_generator
gem install travis

# Get and install PIP
cd /tmp
curl -O https://bootstrap.pypa.io/get-pip.py
python get-pip.py

# Install PIP utilities
pip install --upgrade pip setuptools
pip install awscli virtualenv virtualenvwrapper

# Install GCP tools
# NOTE: Interractive
curl https://sdk.cloud.google.com | bash
