#!/bin/bash

export PYENV_ROOT=${HOME}/.pyenv
eval "$(pyenv init -)"
export PATH="/usr/local/opt/curl/bin:$PATH"

pyenv_install_python(){
    version=$1
    fact=`pyenv versions | grep $version`
    if [ "x${fact}" == "x" ]; then 
        echo "Pyenv : not installed ... ${version}"
        echo "Instaling ....."
        CFLAGS="-I$(brew --prefix readline)/include" \
        CFLAGS="-I$(brew --prefix openssl)/include" \
        CFLAGS="-I$(brew --prefix sqlite)/include" \
        CFLAGS="-I$(brew --prefix expat)/include" \
        CFLAGS="-I$(xcrun --show-sdk-path)/usr/include" \
        LDFLAGS="-L$(brew --prefix readline)/lib" \
        LDFLAGS="-L$(brew --prefix openssl)/lib" \
        LDFLAGS="-L$(brew --prefix sqlite)/lib" \
        LDFLAGS="-L$(brew --prefix expat)/lib" \
        pyenv install -v ${version}
    else
        echo "Pyenv: already installed ... ${version}"
        # Make sure pip is installed for every version
        if [ ! -e ${PYENV_ROOT}/versions/${version}/bin/pip ]; then
        echo "Error: for some reason pip is not installed for python versions: ${version}"
        fi 
    fi
}

brew install readline 
brew install xz 
brew link xz
brew install sqlite3 
brew install openssl 
brew install expat

#pip uninstall pyserial
#sudo pip install pyserial

pyenv install -l



pyenv_install_python 2.7.14
pyenv_install_python 3.6.3


# Keep 2.7.14 as default python version
pyenv local 2.7.14
pyenv global 2.7.14
wget https://bootstrap.pypa.io/get-pip.py
python get-pip.py
# Install dotfiles
pip install dotfiles





