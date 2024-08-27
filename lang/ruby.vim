let s:Ruby = g:Language.New()
let g:Ruby = s:Ruby

"
function! s:Ruby.LoadAtoms()
    runtime lang/ruby/atoms.vim
endfunction

"
function! s:Ruby.LoadTokens()
    runtime lang/ruby/tokens/arguments.vim
endfunction

"
function! s:Ruby.RegisterTokens()
    call s:Ruby.tokens.RegisterArts()
    "call s:Ruby.tokens.RegisterBarbs()
endfunction

"
function! s:Ruby.RegisterAtoms()
    call s:Ruby.atoms.RegisterBase()
    call s:Ruby.atoms.RegisterTags()
endfunction

"
function! s:Ruby.Initialize()
    call s:Ruby.LoadAtoms()
    call s:Ruby.LoadTokens()

    call s:Ruby.RegisterAtoms()
    call s:Ruby.RegisterTokens()
endfunction
