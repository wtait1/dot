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

# copy files for dotbot to `link`
echo 'Copying files...'
cp ~/.vimrc ./src/vimrc
cp ~/.zshrc ./src/zshrc
cp ~/.p10k.zsh ./src/p10k.zsh
cp ~/.config/shell/customization ./src/shell-customization
cp ~/.config/iterm2/com.googlecode.iterm2.plist ./src/com.googlecode.iterm2.plist

