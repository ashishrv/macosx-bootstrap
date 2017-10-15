#!/bin/bash

fact=`command -v brew`
if [ "x${fact}" == "x" ]; then
    echo "Homebrew is not installed."
    echo "Installing  ... homebrew"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    rc=$?; 
    if [[ $rc != 0 ]]; then 
        echo "Error in brew installation"; exit $rc; 
    fi
fi

echo "Homebrew is installed already --- "

install_brew_package(){
    brew_formula=$1
    brew_formula_basename=$(basename $brew_formula)
    if [ "x${brew_formula}" != "x" ]; then 
        if brew ls --versions ${brew_formula_basename} > /dev/null; then
            echo "Brew formula available: ${brew_formula}"
        else
            # The package is not installed, install package
            brew install ${brew_formula}
        fi
    fi
}

install_brew_package readline
install_brew_package xz
install_brew_package wget
install_brew_package cask
install_brew_package homebrew/dupes/apple-gcc42

# Get Homebrew-Cask: https://caskroom.github.io/
brew tap caskroom/cask
# https://github.com/caskroom/homebrew-versions
brew tap caskroom/versions
# https://github.com/caskroom/homebrew-fonts
brew tap caskroom/fonts 

