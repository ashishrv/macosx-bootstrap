#!/bin/bash

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

install_brew_package golang
install_brew_package node
