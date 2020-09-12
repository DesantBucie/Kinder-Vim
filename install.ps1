$vimrc = "~\_vimrc"
$vim = "~\_vim"

if (Test-Path $vimrc -PathType leaf) {
    Rename-Item -Path $vimrc -NewName "_vimrc_backup"
}

if (Test-Path $vim -PathType leaf) {
    Rename-Item -Path $vim -NewName "_vim_backup"
}
Copy-Item .vimrc _vimrc

Copy-Item .vim ~\ -Recurse

if (Test-Path "coc-settings.json" -PathType leaf) {
    Copy-Item coc-settings.json ~\.vim\
}
else {
    Get-Content _vimrc | 
        Where-Object ReadCount -ne 54 |
            Set-Content -Encoding Utf8 _vimrc.temp
            Move-Item -Force _vimrc.temp _vimrc
}
Copy-Item _vimrc ~\

vim -c "PlugInstall|q|q"

vim -c "CocInstall coc-css coc-cssmodules coc-stylelintplus coc-tsserver coc-json coc-html coc-discord coc-emmet coc-todolist coc-template |q|q"


