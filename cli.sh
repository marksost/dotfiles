#!/usr/bin/env bash

# Install apt packages
echo "Installing apt packages..."
sudo apt update
sudo apt install -y $(grep -vE "^\s*#" "./apt/packages.txt"  | tr "\n" " ")

# Install NPM packages
echo "\nInstalling node packages..."
npm install -g eslint jshint

# Install gems
echo "\nInstalling ruby gems..."
gem install github_changelog_generator
gem install travis

# Install PIP utilities
echo "\nInstalling pip packages..."
sudo pip install --upgrade pip setuptools
sudo pip install awscli virtualenv virtualenvwrapper

# Install Terraform
echo "\nInstalling Terraform..."
(
  cd /tmp
  wget https://releases.hashicorp.com/terraform/0.11.8/terraform_0.11.8_linux_amd64.zip
  unzip terraform_0.11.8_linux_amd64.zip
  sudo mv terraform /usr/local/bin/
)
