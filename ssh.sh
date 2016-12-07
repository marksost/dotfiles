#!/usr/bin/env bash

# Set email address to add as key comment
# NOTE: Change as needed
EMAIL="sostmark@gmail.com"

# Store key name to use
if [ -z "$PERSONALKEYNAME" ]; then
	KEYNAME="id_rsa"
else
	KEYNAME=$PERSONALKEYNAME
fi

# Set key file to create
KEYFILE="$HOME/.ssh/$KEYNAME"

# Generate new SSH key
# NOTE: `-q` silences the agent and `-N` sets an empty password
ssh-keygen -t rsa -b 4096 -C $EMAIL -f $KEYFILE -q -N ""

# Ensure SSH agent is running
eval "$(ssh-agent -s)"

# Add key to 
ssh-add "$HOME/.ssh/$KEYNAME"
