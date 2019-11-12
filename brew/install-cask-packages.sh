#!/bin/bash

cur_dir=`pwd`
SCRIPT_PATH=$(cd $(dirname "$0") && pwd -P)
SCRIPT_FILE=$0



install_cask_package(){
    brew_formula=$1
    brew_formula_basename=$(basename $brew_formula)
    if [ "x${brew_formula}" != "x" ]; then
        if brew cask ls --versions ${brew_formula_basename} > /dev/null; then
            echo "Brew cask package is available: ${brew_formula}"
        else
            # The package is not installed, install package
            brew cask install ${brew_formula}
        fi
    fi
}

cat ${SCRIPT_PATH}/casks/cask_packages.txt | while read LINE
do
	echo "Checking brew cask package: ${LINE}"
    install_cask_package ${LINE}
done
