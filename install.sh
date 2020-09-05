VIMRC=~/.vimrc
VIM=~/.vim
if [-d "$VIM" ]; then
    mv ~/.vim ~/.vim_backup
fi

if [-f "VIMRC"]; then
    mv ~/.vimrc ~/.vimrc_backup
fi

cp .vimrc ~/
cp -r .vim ~/

vim +PlugInstall +q +q

vim "+CocInstall coc-css"
