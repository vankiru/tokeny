if exists('g:loaded_vimtalon_autoload')
    finish
endif
let g:loaded_vimtalon_autoload = 1

function! vimtalon#LoadLib()
    runtime lib/token.vim
    runtime lib/select.vim
    runtime lib/language.vim
endfunction

function! vimtalon#InitRuby()
    runtime lang/ruby.vim
    call g:Ruby.Initialize()
endfunction

function! vimtalon#prepare()
    call vimtalon#LoadLib()
    call vimtalon#InitRuby()
endfunction
