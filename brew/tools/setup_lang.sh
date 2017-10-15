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

install_brew_package autoconf
install_brew_package automake
install_brew_package bash
install_brew_package bash-completion
install_brew_package boost
install_brew_package boost-build
install_brew_package cmake
install_brew_package cython
install_brew_package diff-so-fancy
install_brew_package tmux
install_brew_package ruby
install_brew_package ruby-build
install_brew_package erlang
install_brew_package elixir
install_brew_package graphviz
install_brew_package golang
install_brew_package node
