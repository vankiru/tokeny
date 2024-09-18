" Title:        tokeny
" Description:  vim commands for editing code files through Talon
" Maintainer:   Julia Egorova <https://github.com/vankiru>

if exists("g:loaded_tokeny")
  finish
endif
let g:loaded_tokeny = 1

function! TokenyTo(token, id = '', key = 'token')
    let language = g:Ruby
    let token = language.GetToken(a:token)

    call token.GoTo(a:id, a:key)
endfunction

function! TokenyBack(token, id = '', key = 'token')
    let language = g:Ruby
    let token = language.GetToken(a:token)

    call token.GoBack(a:id, a:key)
endfunction

function! TokenySelect(token, id = '', key = 'token')
endfunction

function! TokenyChunk(token, id = '')
endfunction

function! TokenyChange(token, id = '')
endfunction

function! TokenyRename(token, id = '')
endfunction

function! TokenyTest(token, id = '')
endfunction
