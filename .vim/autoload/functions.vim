let g:NERDIsOpen = 0
let g:TabSpaces = 4

function! functions#Open()
    silent exec "!open -a Safari -n"
endfunction

function! functions#Nerd()

    if g:NERDIsOpen == 0
        NERDTreeToggle | NERDTreeRefreshRoot
        let g:NERDIsOpen = 1
    else
        NERDTreeToggle
        let g:NERDIsOpen = 0
    endif

endfunction

function! functions#TabSpaces()
    if g:TabSpaces == 4
        set tabstop = 2 | set shiftwidth = 2
        let g:TabSpaces = 2
        
    else
        set tabstop = 4 | set shiftwidth = 4
        let g:TabSpaces = 4
        
    endif
endfunction

function! functions#UpdateVerde()
    PlugUpdate
    CocUpdate
    PlugClean
endfunction

function! functions#Minify()
    let filetype = expand('%:e')
    if filetype == 'xml' | filetype == 'html'
        call XmlMinify()
    endif
endfunction

function! XmlMinify()
  set filetype=xml
  filetype indent on
  normal! ggVGJ
  execute "%s/>\s\+</></e"
  execute "%s/> </></e"
endfunction

