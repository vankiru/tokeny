" Title:        vim-talon
" Description:  vim commands for editing code files through Talon
" Maintainer:   Julia Egorova <https://github.com/vankiru>

if exists("g:loaded_vimtalon")
  finish
endif
let g:loaded_vimtalon = 1

function! s:GetToken(name, id)
    let language = g:Ruby
    return language.tokens[a:name].Regex(a:id)
endfunction

function! g:GoTo(name, id = '')
    let regex = GetToken(name, id)
    call search(regex)
endfunction

function! g:GoBack(name, id = '')
    let regex = GetToken(name, id)
    call search(regex, 'b')
endfunction
