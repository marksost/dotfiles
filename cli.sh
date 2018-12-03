#!/usr/bin/env bash

# Install brew if needed
if ! hash brew &> /dev/null; then
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Ensure directories are writable
sudo chown -R $(whoami) /usr/local/bin

# Ensure brew is up to date
brew update

# Upgrade any installed packages
brew upgrade

# Install GPG
brew install gpg

# Install RVM before installing other binaries
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -sSL https://get.rvm.io | bash -s stable --ruby
rvm install 2.4.1
rvm use 2.4.1

# Install brew packages
for FORMULA in $(cat "./brew/formula-list.txt"); do
  brew install "${FORMULA}"
done

# Install NPM packages
npm install -g eslint jshint bower grunt-cli

# Install gems
gem install github_changelog_generator
gem install travis

# Ensure directories are writable
sudo chown -R $(whoami) /Library/Python/2.7

# Get and install PIP
cd /tmp
curl -O https://bootstrap.pypa.io/get-pip.py
python get-pip.py

# Install PIP utilities
pip install --upgrade pip setuptools --ignore-installed six
pip install awscli virtualenv virtualenvwrapper --ignore-installed six

# Install Istio
(
  cd $HOME
  ISTIO_VERSION=$(curl -L -s https://api.github.com/repos/istio/istio/releases/latest | jq -r '.tag_name')
  NAME="istio"
  URL="https://github.com/istio/istio/releases/download/${ISTIO_VERSION}/istio-${ISTIO_VERSION}-osx.tar.gz"
  echo "Downloading istio from ${URL} ..."
  curl -L "${URL}" | tar xz
  mv "${NAME}-${ISTIO_VERSION}" "${NAME}"
  cd istio
  cp bin/istioctl /usr/local/bin/.
)

# Install GCP tools
# NOTE: Interractive
curl https://sdk.cloud.google.com | bash
