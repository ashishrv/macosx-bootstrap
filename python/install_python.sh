#!/bin/bash

export PYENV_ROOT=${HOME}/.pyenv
eval "$(pyenv init -)"
export PATH="/usr/local/opt/curl/bin:$PATH"


pyenv_install_python(){
    version=$1
    fact=`pyenv versions | grep $version`
    if [ "x${fact}" == "x" ]; then
        echo "Pyenv : not installed ... ${version}"
        echo "CFLAGS = $CFLAGS"
        echo "CPPFLAGS = $CPPFLAGS"
        echo "LDFLAGS = $LDFLAGS"
        echo
        echo
        echo "Installing ....."
        CFLAGS="$CFLAGS" \
        LDFLAGS="$LDFLAGS" \
        PKG_CONFIG_PATH="$PKG_CONFIG_PATH" \
        CPPFLAGS="$CPPFLAGS" \
        CONFIGURE_OPTS="--with-openssl=$(brew --prefix openssl@1.1)" \
        PYTHON_CONFIGURE_OPTS="--enable-unicode=ucs2  --enable-optimizations" \
        pyenv install -v ${version}
    else
        echo "Pyenv: already installed ... ${version}"
        # Make sure pip is installed for every version
        if [ ! -e ${PYENV_ROOT}/versions/${version}/bin/pip ]; then
        echo "Error: for some reason pip is not installed for python versions: ${version}"
        fi
    fi

}

brew_install_package(){
    package=$1
    brew ls --versions $package
    rc=$?;
    if [[ $rc != 0 ]]; then
        echo "Installing brew package: $package";
        brew install $package
    else
        echo "Package already installed: $package";
    fi

}

brew_install_package readline
brew_install_package xz
brew_install_package sqlite3
brew_install_package openssl
brew_install_package expat

#brew unlink xz && brew link xz


unset CFLAGS
unset CPPFLAGS

export CFLAGS="-I$(xcrun --show-sdk-path)/usr/include"
export CFLAGS="-I$(brew --prefix readline)/include $CFLAGS"
#export CFLAGS="-I$(brew --prefix openssl)/include $CFLAGS"
export CFLAGS="-I$(brew --prefix sqlite)/include $CFLAGS"
export CFLAGS="-I$(brew --prefix xz)/include $CFLAGS"



export CPPFLAGS="-I$(xcrun --show-sdk-path)/usr/include"
export CPPFLAGS="-I$(brew --prefix readline)/include $CPPFLAGS"
#export CPPFLAGS="-I$(brew --prefix openssl)/include $CPPFLAGS"
export CPPFLAGS="-I$(brew --prefix sqlite)/include $CPPFLAGS"
export CPPFLAGS="-I$(brew --prefix xz)/include $CPPFLAGS"
export CPPFLAGS="-I/usr/local/opt/openssl@1.1/include $CPPFLAGS"


export LDFLAGS="-I$(xcrun --show-sdk-path)/usr/lib $LDFLAGS"
export LDFLAGS="-L$(brew --prefix readline)/lib $LDFLAGS"
#export LDFLAGS="-L$(brew --prefix openssl)/lib $LDFLAGS"
export LDFLAGS="-L$(brew --prefix sqlite)/lib $LDFLAGS"
export LDFLAGS="-L$(brew --prefix xz)/lib $LDFLAGS"
export LDFLAGS="-L/usr/local/opt/openssl@1.1/lib $LDFLAGS"


export PKG_CONFIG_PATH="$(brew --prefix openssl)/lib/pkgconfig $PKG_CONFIG_PATH"

# These two should be obtained from xcode installed libraries
#export CFLAGS="-I$(brew --prefix expat)/include $CFLAGS"
#export CFLAGS="-I$(brew --prefix zlib)/include $CFLAGS"
#export CPPFLAGS="-I$(brew --prefix zlib)/include $CPPFLAGS"
#export CPPFLAGS="-I$(brew --prefix expat)/include $CPPFLAGS"
#export LDFLAGS="-L$(brew --prefix expat)/lib $LDFLAGS"
#export LDFLAGS="-L$(brew --prefix zlib)/lib $LDFLAGS"




## Only if needed fixing
#pip uninstall pyserial
#sudo pip install pyserial
# pyenv install -l


pyenv_install_python 2.7.14
pyenv_install_python 3.6.3
