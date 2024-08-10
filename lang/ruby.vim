let s:Ruby = g:Language.New()
let g:Ruby = s:Ruby

"
function! s:Ruby.LoadAtoms()
    runtime lang/ruby/atoms/arguments.vim
    runtime lang/ruby/atoms/blocks.vim
    runtime lang/ruby/atoms/names.vim
endfunction

"
function! s:Ruby.LoadTokens()
    runtime lang/ruby/tokens/arts.vim
endfunction

"
function! s:Ruby.RegisterTokens()
endfunction

"
function! s:Ruby.RegisterAtoms()
    call s:Ruby.atoms.RegisterVariableName()
    call s:Ruby.atoms.RegisterInstanceVariableName()
    call s:Ruby.atoms.RegisterClassVariableName()
    call s:Ruby.atoms.RegisterGlobalName()
    call s:Ruby.atoms.RegisterMethodName()
    call s:Ruby.atoms.RegisterSnakeName()
    call s:Ruby.atoms.RegisterConstName()
    call s:Ruby.atoms.RegisterClassName()

    call s:Ruby.atoms.RegisterArt()
    call s:Ruby.atoms.RegisterArts()
    call s:Ruby.atoms.RegisterBarbs()
endfunction

"
function! s:Ruby.Initialize()
    call s:Ruby.LoadAtoms()
    call s:Ruby.LoadTokens()

    call self.RegisterAtoms()
    call self.RegisterTokens()
endfunction
