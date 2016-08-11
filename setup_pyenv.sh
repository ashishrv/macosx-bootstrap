#!/bin/bash

mkdir -p ~/Dotfiles

#Install pyenv
curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash
rc=$?; if [[ $rc != 0 ]]; then echo "error in brew package installation"; exit $rc; fi

# Add to ~/.pyenv_profile and source it.

cat > $HOME/Dotfiles/.pyenv_profile <<- EOM
export PATH="$HOME/.pyenv/bin:\$PATH"
eval "\$(pyenv init -)"
eval "\$(pyenv virtualenv-init -)"
EOM
