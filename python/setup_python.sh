#!/bin/bash

export PYENV_ROOT=${HOME}/.pyenv
eval "$(pyenv init -)"


pyenv_install_python(){
    version=$1
    fact=`pyenv versions | grep $version`
    if [ "x${fact}" == "x" ]; then 
        echo "Pyenv : not installed ... ${version}"
        echo "Instaling ....."
        pyenv install ${version}
    else
        echo "Pyenv: already installed ... ${version}"
        # Make sure pip is installed for every version
        if [ ! -e ${PYENV_ROOT}/versions/${version}/bin/pip ]; then
        echo "Error: for some reason pip is not installed for python versions: ${version}"
        fi 
    fi
}

brew install readline xz sqlite3 openssl

CPPFLAGS="-I/usr/local/opt/zlib/include -I/usr/local/opt/sqlite/include -I/usr/local/opt/openssl/include" LDFLAGS="-L/usr/local/opt/zlib/lib -L/usr/local/opt/sqlite/lib" pyenv_install_python 2.7.14
CPPFLAGS="-I/usr/local/opt/zlib/include -I/usr/local/opt/sqlite/include -I/usr/local/opt/openssl/include" LDFLAGS="-L/usr/local/opt/zlib/lib -L/usr/local/opt/sqlite/lib -L/usr/local/opt/sqlite/lib" pyenv_install_python 3.6.3


# Keep 2.7.14 as default python version
pyenv local 2.7.14
pyenv global 2.7.14


# Install dotfiles
pip install dotfiles





