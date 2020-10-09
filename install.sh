#!/bin/bash

VIMRC=~/.vimrc
VIM=~/.vim
NODE=`which node`
NPM=`which npm`
PLATFORM=`uname`
ARE_CTAGS_BSD=`which ctags`

cp -r .vim .vim.bak
cp  .vimrc .vimrc.bak

if [ $NPM ] && [ $NODE ]; then

    if [ $PLATFORM == *"BSD" ] ||\
    [ $PLATFORM == "Darwin" ] ||\
    [ $PLATFORM == "DragonFly" ]; 
    then

        #coc-settings
        sed -i '' '2i\
        "npm.binPath": "'"$NPM"'"' .vim/coc-settings.json
        #NPM
        sed -i '' '54i\
        let g:coc_node_path = "'"$NODE"'"' .vimrc

        if [ $PLATFORM == "Darwin" ] &&\
        [ $ARE_CTAGS_BSD == "/usr/bin/ctags" ]; 
        then
            echo "BSD Ctags are not supported, you need to install universal ctags from Brew, macports or nix"
        else
            sed -i '' '56i\
            let g:tagbar_ctags_bin = "'"$ARE_CTAGS_BSD"'"' .vimrc
        fi
    elif [ $PLATFORM == Linux ]; then
        #coc-settings
        sed '4 i "npm.binPath": "'"$NPM"'"' .vim/coc-settings.json
        #NPM
        sed '54 i let g:coc_node_path = "'"$NODE"'"' .vimrc
    else 
        Your platform is not supported.
    fi
else
    echo "Node or/and Npm not found in your path"
    rm -rf .vim .vimrc
    mv .vimrc.bak .vimrc
    mv .vim.bak .vim
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

cp .vimrc ~/
echo "Coping vimrc"

vim -c "PlugInstall|q|q"
#CSS Typescript server, json, html
vim -c "CocInstall coc-emmet coc-css coc-cssmodules coc-stylelintplus coc-tsserver coc-json coc-html coc-powershell coc-discord coc-emmet coc-todolist coc-template |q|q"

rm -rf .vim .vimrc
mv .vimrc.bak .vimrc
mv .vim.bak .vim
