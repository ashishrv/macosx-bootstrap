#!/bin/bash
set -e

#
# Setup specific directories
#


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
create_dir personal/software/bin
create_dir works/workspace
create_dir works/docs
create_dir works/notes
create_dir works/software
create_dir works/software/bin
create_dir works/workspace/gitrepo
create_dir works/workspace/scratchdir
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
# Setup a directory inside scratchdir for bootstrap
#

if [ ! -f "${HOME}/personal/scratchdir/master.zip" ]; then
    # https://github.com/ashishrv/macosx-bootstrap/archive/master.zip
    cur_dir=`pwd`
    cd ${HOME}/personal/scratchdir
    curl -LOk https://github.com/ashishrv/macosx-bootstrap/archive/master.zip
    unzip master.zip
    cd ${cur_dir}
fi

if [ -d "${HOME}/personal/scratchdir/macosx-bootstrap-master" ];then
    echo "Mac OSX bootstrap scripts can be found at: "
    echo "  ${HOME}/personal/scratchdir/macosx-bootstrap-master"
    echo "  Run other scripts to install brew, pyenv, battleschool etc"
fi 

sh ${HOME}/personal/scratchdir/macosx-bootstrap-master/brew/setup_brew.sh


