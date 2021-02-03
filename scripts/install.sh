VIMRC_WIN=~/_vimrc
VIMRC=~/.vimrc
VIM=~/.vim
#Which is almost always installed, but won't work on windows' git-bash`
NODE=`which node`
NPM=`which npm`
PLATFORM=`uname`
ARE_CTAGS_BSD=`which ctags`

BSDsInsert() {
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
    NixsInstall
}
LinuxInsert() {
    #coc-settings
    sed -i '4 i "npm.binPath": "'"$NPM"'"' .vim/coc-settings.json
    #NPM
    sed -i '54 i let g:coc_node_path = "'"$NODE"'"' .vimrc
    NixsInstall
}
WindowsInsert() {
    sed -i '1 i let &runtimepath.=",$HOME/.vim"' .vimrc
    #coc-settings
    sed -i '4 i "npm.binPath": "'"$NPM_WIN"'"' .vim/coc-settings.json
    #NPM
    sed -i '54 i let g:coc_node_path = "'"$NODE_WIN"'"' .vimrc
    WindowsInstall
}

NixsInstall() {

    if [ -f "$VIMRC" ]; then
        mv ~/.vimrc ~/.vimrc_backup
        echo ".vimrc found, moving to .vimrc_backup"
    fi

    cp .vimrc ~/
    echo "Coping vimrc"
}
WindowsInstall() {

    if [ -f "$VIMRC_WIN" ]; then
        mv ~/_vimrc ~/_vimrc_backup
        echo ".vimrc found, moving to .vimrc_backup"
    fi

    mv .vimrc _vimrc
    cp _vimrc ~/
    rm _vimrc
    echo "Coping vimrc"
}
main() {
    cd ~
    if  [ -d ~/Verde ]; then
        rm -rf ~/Verde
    fi
    git clone https://github.com/DesantBucie/Verde
    cd ~/Verde


    if [ $NPM ] && [ $NODE ]; then

        if [ $PLATFORM == *"BSD" ] ||\
        [ $PLATFORM == "Darwin" ] ||\
        [ $PLATFORM == "DragonFly" ]; 
        then
            BSDsInsert
        elif [ $PLATFORM == "Linux" ];then
            LinuxInsert
        else 
            Your platform is not supported.
            rm -rf ~/Verde
        fi
    elif [ -x `where npm` ] && [ -x `where node` ] && [ $PLATFORM == "MINGW"* ];then
        WindowsInsert
    else
        echo "Node or/and Npm not found in your path"
        rm -rf ~/Verde
        exit
    fi

    if [ -d "$VIM" ]; then
        mv ~/.vim ~/.vim_backup
        echo ".vim found, moving to .vim_backup"
    fi

    cp -r .vim ~/
    echo "Copying .vim to home directory"

    vim -c "PlugInstall|q|q"
    vim -c "q"


    cd ~/.config/coc/extensions
    npm install coc-angular coc-bookmark coc-calc coc-clangd coc-cmake coc-css coc-css coc-cssmodules coc-emmet coc-highlight coc-html coc-lists coc-markdownlint coc-omnisharp coc-perl coc-phpls coc-powershell coc-python coc-rls coc-sh coc-stylelintplus coc-snippets coc-sourcekit coc-sql coc-svg coc-todolist coc-tsserver coc-yank coc-json --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod
    cd ~/.vim/extensions

    npm install minify js-beautify  --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod
    rm -rf ~/Verde
}
main
