VIM=~/.vim_backup
VIMRC=~/.vimrc_backup

rm -r ~/.vim ~/.vimrc ~/.config/coc

[ -d "$VIM" ] && mv ~/.vim_backup ~/.vim  && echo ".vim_backup found, moving to .vim"

[ -f "$VIMRC" ] && mv ~/.vimrc_backup ~/.vimrc && echo ".vimrc_backup found, moving to .vimrc"


