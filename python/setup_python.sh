#!/bin/bash

export PYENV_ROOT=${HOME}/.pyenv
eval "$(pyenv init -)"
export PATH="/usr/local/opt/curl/bin:$PATH"


pyenv_install_python(){
	version=$1
	if [ ! -e ${PYENV_ROOT}/versions/${version}/bin/pip ]; then
        echo "Error: pip is not installed for python versions: ${version}"
        echo "Setting up pip for version ${version}"
        pyenv local $version
		wget https://bootstrap.pypa.io/get-pip.py
		python get-pip.py
		pip install dotfiles
		rm get-pip.py
    fi 	
}

# Keep 2.7.14 as default python version
pyenv_install_python 2.7.14
pyenv_install_python 3.6.3

