#!/usr/bin/env bash
set -e


SCRIPT_PATH=$(cd $(dirname "$0") && pwd -P)
SCRIPT_FILE=$0

create_dir() {
    dir_to_create=$1
    if [ ! -d "${HOME}/${dir_to_create}" ]; then
        echo "Creating directory: ${HOME}/${dir_to_create}"
        mkdir -p ${HOME}/${dir_to_create}
    fi
}

echo "Creating basic directories ...."

create_dir personal/workspace
create_dir personal/scratchdir
create_dir personal/books
create_dir personal/workspace/projects
create_dir personal/software/bin
create_dir works/docs
create_dir works/notes
create_dir works/software
create_dir works/software/bin
create_dir works/workspace/gitrepo
create_dir works/workspace/scratchdir
create_dir works/workspace/projects
create_dir works/cloudstorage

#
# Check is xcode has been installed
#

fact=`which xcode-select`
if [ "x${fact}" == "x" ]; then
    echo "No xcode has been installed. Please install xcode"
    exit 1
else
    fact=`xcode-select -p`
    echo "Using xcode installation at: ${fact}"
    echo "Checking directory .. ${fact}/usr/bin"
    if [ ! -d "${fact}/usr/bin" ]; then
        echo "Could not find xcode command line tools"
        echo "Trying to install xcode command line tools. Enter sudo password."
        sudo xcode-select --install
    else
        echo "xcode command line tools has been installed."
    fi
fi


#
# Setup homebrew first
#
sh $SCRIPT_PATH/brew/setup_brew.sh

#
# Install pyenv
#
sh $SCRIPT_PATH/pyenv/setup_pyenv.sh

#
# Install python versions
#
sh $SCRIPT_PATH/python/setup_python.sh
