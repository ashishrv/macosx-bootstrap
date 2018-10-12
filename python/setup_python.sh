#!/bin/bash

export PYENV_ROOT=${HOME}/.pyenv
eval "$(pyenv init -)"
export PATH="/usr/local/opt/curl/bin:$PATH"

pyenv_install_pip(){
	version=$1
	fact=`pyenv versions | grep $version`
	if [ "x${fact}" == "x" ]; then 
		echo "Pyenv : not installed ... ${version}"
	else
		if [ ! -e ${PYENV_ROOT}/versions/${version}/bin/pip ]; then
	        echo "Error: pip is not installed for python versions: ${version}"
	        echo "Setting up pip for version ${version}"
	        pyenv local $version
			wget https://bootstrap.pypa.io/get-pip.py
			python get-pip.py
			pip install dotfiles
			rm get-pip.py
	    fi 
    fi	
}

# Keep 2.7.14 as default python version
pyenv_install_pip 2.7.14
pyenv_install_pip 3.6.3

