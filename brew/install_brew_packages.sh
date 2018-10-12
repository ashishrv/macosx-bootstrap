#!/bin/bash

cur_dir=`pwd`
SCRIPT_PATH=$(cd $(dirname "$0") && pwd -P)
SCRIPT_FILE=$0



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


cat ${SCRIPT_PATH}/brew_packages.txt | while read LINE
do
	echo "Checking brew package: ${LINE}"
    install_brew_package ${LINE}
done

