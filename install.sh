#!/bin/bash

VIMRC=~/.vimrc
VIM=~/.vim
COCSETTINGS=coc-settings.json
NODE=`which node`
NPM=`which npm`
PLATFORM=`uname`
ARE_CTAGS_BSD=`which ctags`

if [$NPM] && [$NODE]; then

    if [$PLATFORM == *BSD] 
    || [$PLATFORM == Darwin]
    || [$PLATFORM == DragonFly]; then

        #coc-settings
        sed -i '' '2i\
        "npm.binPath": ""$NPM""' coc-settings.json
        #NPM
        sed -i '' '54i\
        let g:coc_node_path = '"$NPM"'' .vimrc
    elif [$PLATFORM == Linux]; then
        #coc-settings
        sed '4 i "npm.binPath": ""$NPM""' coc-settings.json
        #NPM
        sed '54 i let g:coc_node_path = '"$NPM"'' .vimrc
    fi
else
    echo "Node or/and Npm not found in your path"
    exit
fi

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

cp coc-settings.json ~/.vim
cp .vimrc ~/
echo "Coping vimrc"

vim -c "PlugInstall|q|q"
#CSS Typescript server, json, html
vim -c "CocInstall coc-css coc-cssmodules coc-stylelintplus coc-tsserver coc-json coc-html coc-discord coc-emmet coc-todolist coc-template |q|q"

