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
    let line = line('$')
    if line == 1
        call Unminify()
    else
        call Minify()
endfunction

function! Minify()
    let filetype = expand('%:e')
    if filetype == 'xml' || filetype == 'html'
       silent call XmlMinify()
    endif
endfunction

function! XmlMinify()
    set filetype=xml
    filetype indent on
    normal! ggVGJ
    execute "%s/>\s\+</></e"
    execute "%s/> </></e"
    execute "%s/></>\r</e"
    normal! gg=G
endfunction

function! Unminify()
    let filetype = expand('%:e')
    if filetype == 'js'
        call JsUnminify()
    endif
endfunction

function! XmlUnminify()
    s/<[^>]*>/\r&\r/g
    g/^$/d 
endfunction 

"#Thank you tapanpandita https://coderwall.com/p/lxajqq/vim-function-to-unminify-javascript!
function! JsUnminify()
    %s/{\ze[^\r\n]/{\r/g
    %s/){/) {/g
    %s/};\?\ze[^\r\n]/\0\r/g
    %s/;\ze[^\r\n]/;\r/g
    %s/[^\s]\zs[=&|]\+\ze[^\s]/ \0 /g
    normal ggVG=
endfunction
