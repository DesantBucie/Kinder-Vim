

"#Sets number you see on the left
set number
"#Sets syntax on
syntax on
"#Allows you to use mouse
set mouse=a
"#Built in Hightlight search
"set hlsearch
set shiftround
set smarttab
set smartcase
set ignorecase
"#encoding utf-8
set encoding=utf-8
"#wraping lines
set wrap
set linebreak
set display+=lastline
set scrolloff=1
set sidescrolloff=5
set laststatus=2
set ruler
set wildmenu
set cursorline
"#Disables error bells, without it, it's very difficult to concentrate
set noerrorbells
set title
set background=dark
set nocompatible
set noswapfile
"#Incremental search
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

"#Allows you to see .files
let g:NERDTreeShowHidden = 1  
"#Position of the nerdTree
let g:NERDTreeWinPos = "right"
"#IDK
let g:NERDTreeChDirMode = 1
"Leave line 54-57 for script insertion




"let mapleader = ','

let g:NERDTreeWinSize = 40

call plug#begin('~/.vim/plugged')
    Plug 'itchyny/lightline.vim'
    Plug 'preservim/nerdtree'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'jiangmiao/auto-pairs'
    Plug 'preservim/nerdcommenter'
    Plug 'preservim/tagbar'
    Plug 'chrisbra/Colorizer'
call plug#end()

command Nerd call functions#Nerd()
command BOpen call functions#Open()
command UpdateVerde call functions#UpdateVerde()
"New Tab"
map <leader>t :tabe <CR>
"NerdTree Toggle"
map <leader>n :Nerd<CR>
"Vertial split"
map <leader>s :vsplit<CR>
"Switch between windows"
nnoremap <tab> <C-W>w

an TouchBar.-flexspace2- <Nop>

nmenu TouchBar.File.Minify :call functions#MinifyOrUnminify()<CR>
tmenu TouchBar.File.Minify Un/Minify
nmenu icon=~/.vim/icons/openinbrowser.png TouchBar.File.Open :BOpen <CR><CR>
tmenu TouchBar.File.Open Browser

nmenu icon=NSTouchBarDownloadTemplate TouchBar.Settings.update :UpdateVerde <CR>
tmenu TouchBar.Settings.update Update
nmenu TouchBar.Settings.Tab :call functions#TabSpaces()<CR>
tmenu TouchBar.Settings.Tab Set Tab 2

"Copy"
vmenu icon=~/.vim/icons/foldercopyto.png TouchBar.Copy y

"Comment"
nmenu icon=NSTouchBarTextListTemplate TouchBar.Comment <leader>c<space>
vmenu icon=NSTouchBarTextListTemplate TouchBar.Comment <leader>ci
"Terminal"
nmenu icon=~/.vim/icons/terminal.png TouchBar.Terminal :vert term<CR>

"Tagbar and nerdTree"
nmenu icon=NSTouchBarTagIconTemplate TouchBar.Tagbar :TagbarToggle<CR>

nmenu icon=NSTouchBarSidebarTemplate TouchBar.NERD :Nerd<CR>


colorscheme molokai
