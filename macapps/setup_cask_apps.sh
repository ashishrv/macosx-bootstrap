#!/bin/bash

all_apps=`brew cask list | fmt -1`

mac_app_brew_cask_install() {
    mac_app=$1
    mac_app_basename=$(basename $mac_app)
    available_app=`echo ${all_apps} | grep ${mac_app_basename}`
    if [ "x${available_app}" == "x" ]; then 
        brew cask install ${mac_app}
    else
        echo "Mac application is already installed ... ${mac_app}"
    fi
}

mac_app_brew_cask_install alfred
mac_app_brew_cask_install caskroom/versions/google-chrome-canary
mac_app_brew_cask_install slate
mac_app_brew_cask_install atom
mac_app_brew_cask_install bbedit
mac_app_brew_cask_install brave
mac_app_brew_cask_install caffeine
mac_app_brew_cask_install cheatsheet
mac_app_brew_cask_install chromium
mac_app_brew_cask_install diffmerge
mac_app_brew_cask_install docker
mac_app_brew_cask_install fish
mac_app_brew_cask_install flycut
mac_app_brew_cask_install fork
mac_app_brew_cask_install difffork
mac_app_brew_cask_install skim
mac_app_brew_cask_install gitup
mac_app_brew_cask_install keepassxc
mac_app_brew_cask_install kitematic
mac_app_brew_cask_install laverna
mac_app_brew_cask_install macdown
mac_app_brew_cask_install macvim
mac_app_brew_cask_install meld
mac_app_brew_cask_install nteract
mac_app_brew_cask_install rodeo
mac_app_brew_cask_install r-app
mac_app_brew_cask_install rstudio
mac_app_brew_cask_install skype
mac_app_brew_cask_install sublime-text
mac_app_brew_cask_install virtualbox
mac_app_brew_cask_install virtualbox-extension-pack
mac_app_brew_cask_install vlc
mac_app_brew_cask_install kaleidoscope
mac_app_brew_cask_install notebooks
mac_app_brew_cask_install the-unarchiver
mac_app_brew_cask_install transmission

