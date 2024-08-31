let s:Ruby = g:Language.New()
let g:Ruby = s:Ruby

"
function! s:Ruby.LoadAtoms()
    runtime lang/ruby/atoms.vim
endfunction

"
function! s:Ruby.RegisterAtoms()
    call s:Ruby.atoms.RegisterBase()
    call s:Ruby.atoms.RegisterTags()
endfunction

"
function! s:Ruby.LoadTokens()
    runtime lang/ruby/tokens/arguments.vim
    runtime lang/ruby/tokens/blocks.vim
    runtime lang/ruby/tokens/classes.vim
    runtime lang/ruby/tokens/comments.vim
    runtime lang/ruby/tokens/controls.vim
    "runtime lang/ruby/tokens/data_types.vim
    runtime lang/ruby/tokens/exceptions.vim
endfunction

"
function! s:Ruby.RegisterTokens()
    call s:Ruby.tokens.RegisterArguments()
    call s:Ruby.tokens.RegisterBlock()
    call s:Ruby.tokens.RegisterClasses()
    call s:Ruby.tokens.RegisterComments()
    call s:Ruby.tokens.RegisterControls()
    "call s:Ruby.tokens.RegisterDataTypes()
    call s:Ruby.tokens.RegisterExceptions()
endfunction

"
function! s:Ruby.Initialize()
    call s:Ruby.LoadAtoms()
    call s:Ruby.LoadTokens()

    call s:Ruby.RegisterAtoms()
    call s:Ruby.RegisterTokens()
endfunction

