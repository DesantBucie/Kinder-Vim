VIMRC=~/.vimrc
VIM=~/.vim
COCSETTINGS=coc-settings.json

if [-d "$VIM" ]; then
    mv ~/.vim ~/.vim_backup
fi

if [-f "VIMRC"]; then
    mv ~/.vimrc ~/.vimrc_backup
fi

cp -r .vim ~/

if [-f "COCSETTINGS"]; then
    cp coc-settings.json ~/.vim/
else
    sed '54d' .vimrc
fi

cp .vimrc ~/

vim +PlugInstall +q +q
#CSS Typescript server, json, html
vim "+CocInstall coc-css coc-tsserver coc-json coc-html" +q +q
#Bash and markdown
#vim "+CocInstall coc-sh coc-markdownlint" +q +q

