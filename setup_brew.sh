#!/bin/bash


#Install Homebrew

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

rc=$?; if [[ $rc != 0 ]]; then echo "error in brew installation"; exit $rc; fi

#Install python dependencies

brew install readline xz
rc=$?; if [[ $rc != 0 ]]; then echo "error in brew package installation"; exit $rc; fi
brew install wget
rc=$?; if [[ $rc != 0 ]]; then echo "error in brew package installation"; exit $rc; fi
brew install homebrew/dupes/apple-gcc42
rc=$?; if [[ $rc != 0 ]]; then echo "error in brew package installation"; exit $rc; fi
brew install cask
rc=$?; if [[ $rc != 0 ]]; then echo "error in brew package installation"; exit $rc; fi
brew install brew-cask
rc=$?; if [[ $rc != 0 ]]; then echo "error in brew package installation"; exit $rc; fi

