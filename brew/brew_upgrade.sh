#!/bin/bash

# Make sure xcode command line is installed
sudo xcode-select --install

# Upgrade brew
brew upgrade --all

brew tap caskroom/cask
brew tap caskroom/versions
brew tap caskroom/fonts 

