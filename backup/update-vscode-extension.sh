#!/usr/bin/env bash

cat $HOME/Dropbox/Backup/Apps/Code/User/vscode_extensions_list.txt | xargs -n 1 code --install-extension
