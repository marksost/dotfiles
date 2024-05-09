#!/usr/bin/env bash

set -ev

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

# Install brew packages
for FORMULA in $(cat "./brew/formula-list.txt"); do
  brew install "${FORMULA}"
done

# Make sure Ruby gems are writable
sudo chown -R $(whoami) /Library/Ruby/Gems
