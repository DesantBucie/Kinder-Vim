vim9script

g:NERDIsOpen = 0
g:TabSpaces = 4

def functions#Open()
    const filename = expand('%:p')
     exec '!open' '"' .. filename .. '"'
enddef

def functions#Nerd()

    if g:NERDIsOpen == 0
        NERDTreeToggle | NERDTreeRefreshRoot
        g:NERDIsOpen = 1
    else
        NERDTreeToggle
        g:NERDIsOpen = 0
    endif

enddef

def functions#TabSpaces()

    if g:TabSpaces == 4
        set tabstop=2 | set shiftwidth=2
        g:TabSpaces = 2
        tmenu TouchBar.Settings.Tab Set Tab 4
    else
        set tabstop=4 | set shiftwidth=4
        g:TabSpaces = 4 
        tmenu TouchBar.Settings.Tab Set Tab 2
    endif
enddef

def functions#UpdateVerde()
    PlugUpdate
    CocUpdate
    PlugClean
enddef

def functions#MinifyOrUnminify()
    const line = line('$')
    if line == 1
        silent Unminify()
    else
        silent Minify()
    endif
enddef

def Minify()
    const filename = expand('%:p:r')
    const file = expand('%:p')
    const extension = expand('%:e')

    if  extension == 'css' || extension == 'js'
        silent exec '!~/.vim/extensions/node_modules/minify/bin/minify.js' file ' > ' filename .. '.min.' .. extension  
    elseif extension == 'html' || extension == 'htm'
        silent exec '!~/.vim/extensions/node_modules/minify/bin/minify.js' file ' > ' filename .. '.min.' .. extension
        silent exec '!mv ' filename .. '.min.' .. extension ' ' file
    else
        echo "You can only minify html, css or js"
    endif
enddef

def Unminify()
    const filename = expand('%:p:r')
    const extension = expand('%:e')
    const file = expand('%:p')
    if extension == 'js'
        silent exec '!~/.vim/extensions/node_modules/js-beautify/js/bin/js-beautify.js' file ' > ' filename .. '.umin.' .. extension
    elseif extension == 'html' || extension == 'htm'
        silent exec '!~/.vim/extensions/node_modules/js-beautify/js/bin/html-beautify.js' file ' > ' filename .. '.umin.' .. extension
    elseif extension == 'css'
        silent exec '!~/.vim/extensions/node_modules/js-beautify/js/bin/css-beautify.js' file ' > ' filename .. '.umin.' .. extension
    else
        echo "Only html, js or css can be unminified"
    endif
    silent exec '!mv' filename .. '.umin.' .. extension ' ' file
enddef
defcompile
