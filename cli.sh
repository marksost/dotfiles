#!/usr/bin/env bash

# Install apt packages
sudo apt update
sudo apt install -y $(grep -vE "^\s*#" "./apt/packages.txt"  | tr "\n" " ")

# Install NPM packages
npm install -g eslint jshint

# Install gems
gem install github_changelog_generator
gem install travis

# Install PIP utilities
sudo pip install --upgrade pip setuptools
sudo pip install awscli virtualenv virtualenvwrapper
