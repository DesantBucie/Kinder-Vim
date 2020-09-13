"Basic sets"
"let &runtimepath.=',$HOME/.vim'"
"Sets number you see on the left"
set number
"Sets syntax on"
syntax on
"Allows you to use mouse"
set mouse=a
"Built in Hightlight search"
set hlsearch
set shiftround
set smarttab
set smartcase
set ignorecase
"Encoding utf-8"
set encoding=utf-8
"Wraping lines"
set wrap
set linebreak
set display+=lastline
set scrolloff=1
set sidescrolloff=5
set laststatus=2
set ruler
set wildmenu
set cursorline
"Disables error bells, without it, it's very difficult to conetrate"
set noerrorbells
set title
set background=dark
set nocompatible
set noswapfile
"Incremental search"
set incsearch
set showcmd
set viminfo='0,:0,<0,@0,f0
set nobackup
set nowb
set autoread
set showmatch
set autoindent
set tabstop=4
set shiftwidth=4
set expandtab
set backspace=indent,eol,start

"Allows you to see .files"
let NERDTreeShowHidden=1  
"Position of the nerdTree"
let g:NERDTreeWinPos = "right"
"IDK"
let g:NERDTreeChDirMode = 1
"Put your path to NODE (not NPM) here!
let g:coc_node_path = '/nix/store/52xbdvmcncf1hq4z6qdz321aimckjbgv-nodejs-14.9.0/bin/node'

let g:rainbow_active = 1
let g:rainbow_guifgs = ['RoyalBlue3', 'DarkOrange3', 'DarkOrchid3', 'FireBrick']
let g:rainbow_ctermfgs = ['lightblue', 'lightgreen', 'yellow', 'red', 'magenta']

call plug#begin('~/.vim/plugged')
    Plug 'itchyny/lightline.vim'
    Plug 'preservim/nerdtree'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'jiangmiao/auto-pairs'
    Plug 'frazrepo/vim-rainbow'
    Plug 'preservim/nerdcommenter'
call plug#end()

"New Tab"
map <C-t> :tabe <CR>
"NerdTree Toggle"
map <C-e> :NERDTreeToggle<CR>
"Vertial split"
map <C-s> :vsplit<CR>
"Switch between windows"
nnoremap <tab> <C-W>w

amenu TouchBar.-flexspace2- <Nop>

amenu TouchBar.NerdTree :NERDTreeToggle<CR>

amenu TouchBar.Search /

amenu TouchBar.Terminal :term<CR>

colorscheme molokai
