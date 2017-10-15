#!/bin/bash

fact=`command -v pyenv`
if [ "x${fact}" == "x" ]; then
    echo "pyenv is not installed."
    echo "Installing  ... pyenv"
    brew install pyenv
fi

