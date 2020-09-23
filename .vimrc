vim9script
#let &runtimepath.=',$HOME/.vim'
#Sets number you see on the left
set number
#Sets syntax on
syntax on
#Allows you to use mouse
set mouse=a
#Built in Hightlight search
set hlsearch
set shiftround
set smarttab
set smartcase
set ignorecase
#encoding utf-8
set encoding=utf-8
#wraping lines
set wrap
set linebreak
set display+=lastline
set scrolloff=1
set sidescrolloff=5
set laststatus=2
set ruler
set wildmenu
set cursorline
#Disables error bells, without it, it's very difficult to conetrate
set noerrorbells
set title
set background=dark
set nocompatible
set noswapfile
#Incremental search
set incsearch
set showcmd
set viminfo='0,:0,<0,@0,f0
set nobackup
set nowb
set autoread
set showmatch
set autoindent
set tabstop =4
set shiftwidth =4
set expandtab
set backspace =indent,eol,start

#Allows you to see .files
g:NERDTreeShowHidden = 1  
#Position of the nerdTree
g:NERDTreeWinPos = "right"
#IDK
g:NERDTreeChDirMode = 1
#Put your path to NODE (not NPM) here!
g:coc_node_path = '/nix/store/*-nodejs-*/bin/node'

g:rainbow_active = 1
g:rainbow_guifgs = ['RoyalBlue3', 'DarkOrange3', 'DarkOrchid3', 'FireBrick'] 
g:rainbow_ctermfgs = ['lightblue', 'lightgreen', 'yellow', 'red', 'magenta']
g:tagbar_ctags_bin = '/nix/store/*-ctags-816/bin/ctags'
#let mapleader = ','

plug#begin('~/.vim/plugged')
    Plug 'itchyny/lightline.vim'
    Plug 'preservim/nerdtree'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'jiangmiao/auto-pairs'
    Plug 'frazrepo/vim-rainbow'
    Plug 'preservim/nerdcommenter'
    Plug 'preservim/tagbar'
    Plug 'chrisbra/Colorizer'
plug#end()
def Open() 
    silent exec "!open -a Safari -n"
enddef
command Open call Open()
"def TabWidth() 
    "if tabswitch == false
        ":set tabstop = 2 <bar> :set shiftwidth=2 <CR>
        "tabswitch = true
    "else
        ":set tabstop = 4 <bar> :set shiftwidth=4 <CR>
    "endif
"enddef
defcompile
"New Tab"
map <leader>t :tabe <CR>
"NerdTree Toggle"
map <leader>n :NERDTreeRefreshRoot <bar> :NERDTreeToggle<CR>
"Vertial split"
map <leader>s :vsplit<CR>
"Switch between windows"
nnoremap <tab> <C-W>w

an TouchBar.-flexspace2- <Nop>

nmenu TouchBar.File.New :vnew<CR>
nmenu TouchBar.File.Save :w<CR>
nmenu TouchBar.File.Tab :tabe<CR>
tmenu TouchBar.File.Tab New Tab
nmenu icon=~/.vim/icons/openinbrowser.png TouchBar.File.Open :Open <CR><CR>
tmenu TouchBar.File.Open Open in Browser

nmenu icon=NSTouchBarDownloadTemplate TouchBar.Settings.update :PlugUpdate <CR>
tmenu TouchBar.Settings.update Update 
nmenu TouchBar.Settings.tabwidth2 :set tabstop=2 <bar> :set shiftwidth=2 <CR> 
tmenu TouchBar.Settings.tabwidth2 Tab width 2
nmenu TouchBar.Settings.tabwidth4 :set tabstop=4 <bar> :set shiftwidth=4 <CR>
tmenu TouchBar.Settings.tabwidth4 Tab width 4

"Copy"
vmenu icon=~/.vim/icons/foldercopyto.png TouchBar.Copy y

"Comment"
nmenu icon=NSTouchBarTextListTemplate TouchBar.Comment <leader>c<space>
vmenu icon=NSTouchBarTextListTemplate TouchBar.Comment <leader>ci
"Terminal"
nmenu icon=~/.vim/icons/terminal.png TouchBar.Terminal :vert term<CR>

"Tagbar and nerdTree"
nmenu icon=NSTouchBarTagIconTemplate TouchBar.Tagbar :TagbarToggle<CR>

nmenu icon=NSTouchBarSidebarTemplate TouchBar.NERD :NERDTreeRefreshRoot <bar> :NERDTreeToggle<CR>


colorscheme molokai
