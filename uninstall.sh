VIM=~/.vim_backup
VIMRC=~/.vimrc_backup

rm -rf ~/.vim ~/.vimrc ~/.config/coc

if [ -d "$VIM" ]; then
    mv ~/.vim_backup ~/.vim
    echo ".vim_backup found, moving to .vim"
fi

if [ -f "$VIMRC" ]; then
    mv ~/.vimrc_backup ~/.vimrc
    echo ".vimrc_backup found, moving to .vimrc"
fi

