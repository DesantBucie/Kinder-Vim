#!/bin/bash

VIMRC=~/.vimrc
VIM=~/.vim
COCSETTINGS=coc-settings.json
NIX=/nix/store/*node*
NVM=~/.nvm


if [ -d "$VIM" ]; then
    mv ~/.vim ~/.vim_backup
    echo ".vim found, moving to .vim_backup"
fi

if [ -f "$VIMRC" ]; then
    mv ~/.vimrc ~/.vimrc_backup
    echo ".vimrc found, moving to .vimrc_backup"
fi

cp -r .vim ~/
echo "Coping .vim to home directory"

    
if [  -f "$COCSETTINGS" ]; then
    cp coc-settings.json ~/.vim/
    echo "Cocsetting found, moving to ~/.vim"
else
    sed '54d' .vimrc
    echo "custom npm not found, removing line 54 from .vimrc"
fi

cp .vimrc ~/
echo "Coping vimrc"

vim -c "PlugInstall|q|q"
#CSS Typescript server, json, html
vim -c "CocInstall coc-css coc-cssmodules coc-stylelintplus coc-tsserver coc-json coc-html coc-discord coc-emmet coc-todolist coc-template |q|q"

