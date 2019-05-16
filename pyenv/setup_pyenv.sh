#!/bin/bash

fact=`command -v pyenv`
if [ "x${fact}" == "x" ]; then
    echo "pyenv is not installed."
    echo "Installing  ... pyenv"
    brew upgrade 'openssl@1.1'
    brew install pyenv
fi
