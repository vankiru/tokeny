if exists('g:loaded_vimtalon_autoload')
    finish
endif
let g:loaded_vimtalon_autoload = 1

function! vimtalon#loadLib()
    runtime lib/token.vim
    runtime lib/select.vim
    runtime lib/language.vim
endfunction

function! vimtalon#initRuby()
    runtime lang/ruby.vim
    call g:Ruby.Initialize()
endfunction

function! vimtalon#prepare()
    call vimtalon#loadLib()
    call vimtalon#initRuby()
endfunction

function! vimtalon#defineCommands()
    command -nargs=* GoTo :call GoTo(<f-args>)
    command -nargs=* GoBack :call GoBack(<f-args>)
endfunction
