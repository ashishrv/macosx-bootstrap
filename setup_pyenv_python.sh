#!/bin/bash

source ~/.Dotfiles/.pyenv_profile

# Install Python
pyenv update
pyenv install -l
pyenv install 2.7.12
pyenv install 3.1.1
pyenv global 3.1.1
pyenv local 2.7.12
pyenv versions

# Install PIP
wget https://bootstrap.pypa.io/get-pip.py
python get-pip.py

# Install Ansible package
pip install —upgrade pip
pip install mercurial
pip install battleschool

