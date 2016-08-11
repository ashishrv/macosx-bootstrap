#!/bin/bash
SCRIPT_PATH=$(cd $(dirname "$0") && pwd -P)
SCRIPT_FILE=$0

# Install Xcode command line tools
sh $SCRIPT_PATH/setup_xcode_cmdline.sh

# Install Homebrew
sh $SCRIPT_PATH/setup_brew.sh

# Install pyenv
sh $SCRIPT_PATH/setup_pyenv.sh

# Install python versions
sh $SCRIPT_PATH/setup_pyenv_python.sh


# Setup battleschool
mkdir -p ~/.battleschool
cp $SCRIPT_PATH/battleschool_config.yaml ~/.battleschool/config.yml

# Run battleschool
echo "Provide sudo password for mac osx"
battle --ask-sudo-pass --update-sources

# Install Fishshell
brew install fish

# Add fish shell
echo "/usr/local/bin/fish" | sudo tee -a /etc/shells

#Make fishshell the default
chsh -s /usr/local/bin/fish
