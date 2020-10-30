let g:NERDIsOpen = 0
let g:TabSpaces = 4

function! functions#Open()
    let l:file = expand('%:p')
    silent exec '!open -a Safari ' l:file
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
        set tabstop=2 | set shiftwidth=2
        let g:TabSpaces = 2
        tmenu TouchBar.Settings.Tab Set Tab 4
    else
        set tabstop=4 | set shiftwidth=4
        let g:TabSpaces = 4 
        tmenu TouchBar.Settings.Tab Set Tab 2
    endif
endfunction

function! functions#UpdateVerde()
    PlugUpdate
    CocUpdate
    PlugClean
endfunction

function! functions#MinifyOrUnminify()
    let l:line = line('$')
    if l:line == 1
        call Unminify()
    else
        call Minify()
    endif
endfunction

function! Minify()
    "let l:file = expand('%:t')
    "let l:name = expand('%:r')
    "let l:path = expand('%:p:h')
    let l:extension = expand('%:e')
    if l:extension == 'html' || l:extension == 'htm'|| l:extension == 'css' || l:extension == 'js'
        exec '!minify ' l:file ' > ' l:path '/' l:name '.min.' l:extension
    else
        echo "You can only minify html, css or js"
endfunction
