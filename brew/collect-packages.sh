#!/bin/bash

SCRIPT_PATH=$(cd $(dirname "$0") && pwd -P)
SCRIPT_FILE=$(basename $0)

fact=`command -v brew`
if [ "x${fact}" == "x" ]; then
    echo "Homebrew is not installed."
else
    brew list --formula | fmt -1 > $SCRIPT_PATH/packages/brew_packages.txt
    if brew ls --versions cask > /dev/null; then
        brew list --cask | fmt -1 > $SCRIPT_PATH/casks/cask_packages.txt
    else
        echo "Homebrew cask is not installed."
    fi
fi
