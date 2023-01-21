#!/bin/bash

set -e

SRC='./src'
if [ ! -d $SRC ]; then mkdir -p $SRC; fi

# capture homebrew stuff
echo 'Bundling homebrew stuff...'
brew bundle dump --force --file $SRC/Brewfile

# vscode extensions
# https://superuser.com/a/1452176
echo 'Copying vscode extensions...'
code --list-extensions > $SRC/vs_code_extensions_list.txt

function copy() {
    if [[ ! -f "$1" ]]; then
        echo "File=$1 does not exist! Exiting..."
        exit 1
    fi
    cp "$1" "$2" || true
}

# copy files for dotbot to `link`
echo 'Copying files...'
copy ~/.zshrc ./src/zshrc
