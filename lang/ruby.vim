let s:Ruby = g:Language.New()
let g:Ruby = s:Ruby

function! s:Ruby.RegisterAtoms()
  runtime lang/ruby/atoms/*.vim

  call g:Ruby.atoms.RegisterBaseName()
  call g:Ruby.atoms.RegisterVariableName()
  call g:Ruby.atoms.RegisterInstanceVariableName()
  call g:Ruby.atoms.RegisterClassVariableName()
  call g:Ruby.atoms.RegisterGlobalName()
  call g:Ruby.atoms.RegisterMethodName()
  call g:Ruby.atoms.RegisterSnakeName()
  call g:Ruby.atoms.RegisterConstName()
  call g:Ruby.atoms.RegisterClassName()

  call g:Ruby.atoms.RegisterArt()
  call g:Ruby.atoms.RegisterArts()
  call g:Ruby.atoms.RegisterBarbs()
endfunction

function! s:Ruby.RegisterTokens()
  runtime lang/ruby/tokens/*.vim
endfunction

function! s:Ruby.Initialize()
    call self.RegisterAtoms()
    call self.RegisterTokens()
endfunction
