" Title:        vim-talon
" Description:  vim commands for editing code files through Talon
" Maintainer:   Julia Egorova <https://github.com/vankiru>

if exists("g:loaded_vimtalon")
  finish
endif
let g:loaded_vimtalon = 1

function! GoTo(token, id = '', key = 'token')
    let language = g:Ruby
    let token = language.GetToken(a:token)

    call token.GoTo(a:id, a:key)
endfunction

function! GoBack(token, id = '', key = 'token')
    let language = g:Ruby
    let token = language.GetToken(a:token)

    call token.GoBack(a:id, a:key)
endfunction
