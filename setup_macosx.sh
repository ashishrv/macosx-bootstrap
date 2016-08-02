#!/bin/bash
#Install Homebrew

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

rc=$?; if [[ $rc != 0 ]]; then echo "error in brew installation"; exit $rc; fi

#Install Xcode command line tools: 
sudo xcode-select --install


#Install python dependencies

brew install readline xz
rc=$?; if [[ $rc != 0 ]]; then echo "error in brew package installation"; exit $rc; fi
brew install wget
rc=$?; if [[ $rc != 0 ]]; then echo "error in brew package installation"; exit $rc; fi
brew install homebrew/dupes/apple-gcc42
rc=$?; if [[ $rc != 0 ]]; then echo "error in brew package installation"; exit $rc; fi
brew install cask
rc=$?; if [[ $rc != 0 ]]; then echo "error in brew package installation"; exit $rc; fi
brew install brew-cask
rc=$?; if [[ $rc != 0 ]]; then echo "error in brew package installation"; exit $rc; fi



#Install pyenv


curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash
rc=$?; if [[ $rc != 0 ]]; then echo "error in brew package installation"; exit $rc; fi

Add to ~/.pyenv_profile and source it.

export PATH="/Users/vidyarthi/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"




pyenv update


pyenv install -l
pyenv install 2.7.12
pyenv install 3.1.1
pyenv global 3.1.1
pyenv local 2.7.12
pyenv versions


wget https://bootstrap.pypa.io/get-pip.py
python get-pip.py


pip install —upgrade pip
pip install mercurial
pip install battleschool




mkdir ~/.battleschool
cd .battleschool
curl -L https://db.tt/aG2uyydU > config.yml
Change config.yml


---
cache_dir: ~/Library/Caches/battleschool

sources:

  git:
    - name: 'osx'
      repo: 'https://github.com/ashishrv/ansible-osx.git'
      playbooks:
         - vagrant.yml
         - virtualbox.yml
         - alfred.yml
         - chrome-beta.yml
         - chrome-canary.yml
         - dropbox.yml
         - karabiner.yml
         - java8.yml
         - iterm2.yml
         - macvim.yml
         - better-touch-tool.yml
         - adium.yml
         - github.yml
         - gitx.yml





...

Run command

battle --ask-sudo-pass --update-sources

