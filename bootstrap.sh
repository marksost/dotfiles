#!/usr/bin/env bash

# Change to git source directory
cd "$(dirname "${BASH_SOURCE}")";

# Ensure the latest codebase is there
git pull origin master;

# Function to execute
# NOTE: Copies all top-level files from this repo into the bash source directory
function run() {
	rsync --exclude ".git/" \
		--exclude ".DS_Store" \
		--exclude ".macos" \
		--exclude "bootstrap.sh" \
		--exclude "README.md" \
		-avh --no-perms . ~/test;
	source ~/test/.bash_profile;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	run;
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		run;
	fi;
fi;

unset run;
