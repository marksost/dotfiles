#!/usr/bin/env bash

# Make bin directory if needed
[ -d "${HOME}/bin" ] || mkdir -p "${HOME}/bin"

# Install apt packages
echo "Installing apt packages..."
sudo apt update
sudo apt install -y $(grep -vE "^\s*#" "./apt/packages.txt"  | tr "\n" " ")

# Install NPM packages
echo -e "\nInstalling node packages..."
npm install -g eslint jshint

# Install gems
echo -e "\nInstalling ruby gems..."
gem install github_changelog_generator
gem install travis

# Install PIP utilities
echo -e "\nInstalling pip packages..."
sudo pip install --upgrade pip setuptools
sudo pip install awscli virtualenv virtualenvwrapper

# Install Terraform
echo -e "\nInstalling Terraform..."
(
  cd /tmp
  wget https://releases.hashicorp.com/terraform/0.11.8/terraform_0.11.8_linux_amd64.zip
  unzip terraform_0.11.8_linux_amd64.zip
  sudo mv terraform /usr/local/bin/
)

# Install Kuberentes utils
echo -e "\nInstalling Kuberentes utils..."
rm -rf $HOME/.kubectx
git clone https://github.com/ahmetb/kubectx.git $HOME/.kubectx
sudo chmod +x $HOME/.kubectx/kubectx $HOME/.kubectx/kubens
mv $HOME/.kubectx/kubectx $HOME/bin/.
mv $HOME/.kubectx/kubens $HOME/bin/.
COMPDIR=$(pkg-config --variable=completionsdir bash-completion)
sudo ln -sf $HOME/.kubectx/completion/kubectx.bash $COMPDIR/kubectx
sudo ln -sf $HOME/.kubectx/completion/kubens.bash $COMPDIR/kubens
