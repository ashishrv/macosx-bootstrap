#!/bin/bash

export PYENV_ROOT=${HOME}/.pyenv
eval "$(pyenv init -)"
export PATH="/usr/local/opt/curl/bin:$PATH"

brew_install_package(){
    package=$1
    brew ls --versions $package
    rc=$?;
    if [[ $rc != 0 ]]; then
        echo "Installing brew package: $package";
        brew install $package
    else
        echo "Package already installed: $package";
    fi

}

brew_install_package readline
brew_install_package xz
brew_install_package sqlite3
brew_install_package openssl
brew_install_package expat
#brew unlink xz && brew link xz

pyenv install -l
pyenv install 3.7.4
pyenv install 2.7.16
pyenv install anaconda3-2019.03
pyenv install pypy3.6-7.1.1
pyenv install jython-2.7.1
pyenv versions
