VIMRC_WIN=~/_vimrc
VIMRC=~/.vimrc
VIM=~/.vim
#Which is almost always installed, but won't work on windows' git-bash`
NODE=`command -v node`
NPM=`command -v npm`
PLATFORM=`uname`
ARE_CTAGS_BSD=`which ctags`

BSDsInsert() {
        #coc-settings
        sed -i '' '2i\
"npm.binPath": "'"$NPM"'"' .vim/coc-settings.json
        #NPM
        sed -i '' '54i\
let g:coc_node_path = "'"$NODE"'"' .vimrc

        [ $PLATFORM == "Darwin" ] && [ $ARE_CTAGS_BSD == "/usr/bin/ctags" ] && echo "BSD Ctags are not supported, you need to install universal ctags from Brew, macports or nix" ||\
                sed -i '' '56i\
let g:tagbar_ctags_bin = "'"$ARE_CTAGS_BSD"'"' .vimrc
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
        sed -i '4 i "npm.binPath": "'"$NPM"'"' .vim/coc-settings.json
        #NPM
        sed -i '54 i let g:coc_node_path = "'"$NODE"'"' .vimrc
        WindowsInstall
}

NixsInstall() {

    [ -f "$VIMRC" ] && mv ~/.vimrc ~/.vimrc_backup && echo ".vimrc found, moving to .vimrc_backup"
    cp .vimrc ~/
    echo "Coping vimrc"
}
WindowsInstall() {

        [ -f "$VIMRC_WIN" ] && mv ~/_vimrc ~/_vimrc_backup && echo ".vimrc found, moving to .vimrc_backup"
        mv .vimrc _vimrc
        cp _vimrc ~/
        rm _vimrc
        echo "Coping vimrc"
}
main() {
        cd ~
        [ -d ~/Verde ] && rm -r ~/Verde
        git clone https://github.com/DesantBucie/Verde
        cd ~/Verde

        if type node && type npm
        then

                if [ $PLATFORM == *"BSD" ] ||\
                [ $PLATFORM == "Darwin" ] ||\
                [ $PLATFORM == "DragonFly" ] 
                then
                        BSDsInsert
                elif [ $PLATFORM == "Linux" ]
                then
                        LinuxInsert
                else 
                        echo Your platform is not supported.
                        rm -rf ~/Verde
                fi
        elif $NPM  && $NODE  && [ $PLATFORM == "MINGW"* ]
        then
                WindowsInsert
        else
                echo "Node or/and Npm not found in your path"
                rm -rf ~/Verde
                exit
        fi

        [ -d "$VIM" ] && mv ~/.vim ~/.vim_backup && echo ".vim found, moving to .vim_backup"

        cp -r .vim ~/
        echo "Copying .vim to home directory"

        vim -c "PlugInstall|q|q"
        vim -c "q"


        cd ~/.config/coc/extensions
        npm install coc-angular coc-calc coc-clangd coc-cmake coc-css coc-css coc-cssmodules coc-emmet coc-highlight coc-html coc-lists coc-markdownlint coc-omnisharp coc-perl coc-phpls coc-powershell coc-python coc-rls coc-sh coc-stylelintplus coc-snippets coc-sourcekit coc-sql coc-svg coc-todolist coc-tsserver coc-yank coc-json --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod
        cd ~/.vim/extensions

        npm install minify js-beautify  --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod
        rm -rf ~/Verde
}
main
