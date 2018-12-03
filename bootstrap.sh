#!/usr/bin/env bash

# Ensure the latest codebase is checked out
git pull origin master;

# Function to execute
# NOTE: Copies all top-level files from this repo into the bash source directory
function run() {
	rsync --exclude ".git/" \
    --exclude ".DS_Store" \
    --exclude "bin/" \
    --exclude "brew/" \
    --exclude "sublime/" \
    --exclude "terminal/" \
		--exclude "bootstrap.sh" \
		--exclude "cli.sh" \
		--exclude "mac.sh" \
		--exclude "ssh.sh" \
		--exclude "README.md" \
		-avh --no-perms . ~;
	source ~/.bash_profile;
}

# Allow force to prevent confirmation message
if [ "$1" == "--force" -o "$1" == "-f" ]; then
	run;
else
	# Prompt user
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	# Check response
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		run;
	fi;
fi;

unset run;
