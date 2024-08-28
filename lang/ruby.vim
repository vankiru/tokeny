let s:Ruby = g:Language.New()
let g:Ruby = s:Ruby

"
function! s:Ruby.LoadAtoms()
    runtime lang/ruby/atoms.vim
endfunction

"
function! s:Ruby.LoadTokens()
    runtime lang/ruby/tokens/arguments.vim
    runtime lang/ruby/tokens/blocks.vim
    runtime lang/ruby/tokens/classes.vim
    runtime lang/ruby/tokens/comments.vim
endfunction

"
function! s:Ruby.RegisterAtoms()
    call s:Ruby.atoms.RegisterBase()
    call s:Ruby.atoms.RegisterTags()
endfunction

"
function! s:Ruby.RegisterTokens()
    " Arguments
    call s:Ruby.tokens.RegisterComma()
    call s:Ruby.tokens.RegisterArt()
    call s:Ruby.tokens.RegisterArts()
    call s:Ruby.tokens.RegisterBarbs()
    " Blocks
    call s:Ruby.tokens.RegisterBlock()
    " Classes
    call s:Ruby.tokens.RegisterClass()
    call s:Ruby.tokens.RegisterSuperClass()
    call s:Ruby.tokens.RegisterSelfClass()
    call s:Ruby.tokens.RegisterClassInit()
    call s:Ruby.tokens.RegisterPrivate()
    call s:Ruby.tokens.RegisterProtected()
    call s:Ruby.tokens.RegisterPublic()
    call s:Ruby.tokens.RegisterNew()
    " Comments
    call s:Ruby.tokens.RegisterComment()
    call s:Ruby.tokens.RegisterFrozenString()
    call s:Ruby.tokens.RegisterMagicEncode()
    call s:Ruby.tokens.RegisterMagicWarn()
    call s:Ruby.tokens.RegisterMagicShare()
endfunction

"
function! s:Ruby.Initialize()
    call s:Ruby.LoadAtoms()
    call s:Ruby.LoadTokens()

    call s:Ruby.RegisterAtoms()
    call s:Ruby.RegisterTokens()
endfunction

