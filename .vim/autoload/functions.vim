let g:NERDIsOpen = 0
let g:TabSpaces = 4

function! functions#Open()

    let l:file = expand('%:p')
    silent exec '!open ' '"'.l:file.'"'
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
    let l:filename = expand('%:p:r')
    let l:file = expand('%:p')
    let l:extension = expand('%:e')

    if  l:extension == 'css' || l:extension == 'js'
        silent exec '!~/.vim/extensions/node_modules/minify/bin/minify.js' l:file ' > ' l:filename.'.min.'.l:extension  
    elseif l:extension == 'html' || l:extension == 'htm'
        silent exec '!~/.vim/extensions/node_modules/minify/bin/minify.js' l:file ' > ' l:filename.'.min.'.l:extension
        silent exec '!mv ' l:filename.'.min.',l:extension ' ' l:file
    else
        echo "You can only minify html, css or js"
    endif
endfunction

function! Unminify()
    let l:filename = expand('%:p:r')
    let l:extension = expand('%:e')
    let l:file = expand('%:p')
    if l:extension == 'js'
        silent exec '!~/.vim/extensions/node_modules/js-beautify/js/bin/js-beautify.js' l:file ' > ' l:filename.'.umin.'.l:extension
    elseif l:extension == 'html' || l:extension =='htm'
        silent exec '!~/.vim/extensions/node_modules/js-beautify/js/bin/html-beautify.js' l:file ' > ' l:filename.'.umin.'.l:extension
    elseif l:extension == 'css'
        silent exec '!~/.vim/extensions/node_modules/js-beautify/js/bin/css-beautify.js' l:file ' > ' l:filename.'.umin.'.l:extension
    else
        echo "Only html, js or css can be unminified"
    endif
    silent exec '!mv' l:filename.'.umin.'.l:extension ' ' l:file
endfunction
