if exists('g:loaded_tokeny_autoload')
    finish
endif
let g:loaded_tokeny_autoload = 1

function! tokeny#prepare()
    call tokeny#loadLib()
    call tokeny#initRuby()

    call tokeny#defineCommands()
endfunction

function! tokeny#loadLib()
    runtime lib/token.vim
    runtime lib/language.vim
    runtime lib/select.vim
endfunction

function! tokeny#initRuby()
    runtime lang/ruby.vim
    call g:Ruby.Initialize()
endfunction

function! tokeny#defineCommands()
    command -nargs=* TokenyTo :call TokenyTo(<f-args>)
    command -nargs=* TokenyBack :call TokenyBack(<f-args>)
endfunction
