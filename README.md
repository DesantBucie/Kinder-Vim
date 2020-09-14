# Kinder-VIM

More human vim

![Vim.gif](./.github/vim.gif)

## Before we start

I'm a total noob in vim script so I use the simplest methods possible if you see
that something can be improved, just let me know.

## What's the point

When i was introduced to VI(M),i quite did not like it. It was hard to edit
anything for me.

Time passed, and i started to like VIM, but to have autocomplete you have to use
pyhton plugins which to be honest i do not like at all.

But this config/distro is different.

## What's inside

Vim-Plug for packages managment
[vim-plug](https://github.com/junegunn/vim-plug)

Autocompletion system is Coc, node based, very fast and easy to use. In fact
it's very similar to VSCode. [More here:](https://github.com/neoclide/coc.nvim)

It also has NERDTree (as Netrw was too unreliable, and Coc explorer is still in
heavy development)
[NERDTree](https://github.com/preservim/nerdtree)

Colorsheme is molocai ported to vim by tomasr
[Molocai](https://github.com/tomasr/molokai)

## Prerequisites

* nodejs10.12 >
* macvim 8.1 > (vim misses touchbar integration but works)
* ctags (optional)

## Advices

Do not use esc, especially on touchbar macbooks, map esc to caps lock.
System preferences => keyboard => modifier keys (bottom right)
![Map caps lock to esc](./.github/esc.gif)

## Instalation

[Go to wiki](https://github.com/DesantBucie/Kinder-Vim/wiki)

## Uninstall

If you do not like this, and want to remove it, simply delete ~/.vimrc,
and ~.vim from your home directory.
You will also need to remove ~/.config/coc.

![Uninstall.gif](./.github/uninstall.gif)

