#!/usr/bin/env bash

mkdir -p ~/Dropbox/Backup/Apps/Code/User
cp $HOME/Library/"Application Support"/Code/User/settings.json $HOME/Dropbox/Backup/Apps/Code/User/
cp -R $HOME/Library/"Application Support"/Code/User/snippets $HOME/Dropbox/Backup/Apps/Code/User/
code --list-extensions > $HOME/Dropbox/Backup/Apps/Code/User/vscode_extensions_list.txt
