"
function! s:tokens.RegisterComment()
    let line = '''\s*#\s*'' . body'
    let multi = '''=begin\n'' . body . ''[.|\n]\{-}=end'''

    let regex = #{
        \body: noname.text,
        \search: '\%(' . line . '\|' . multi . '\)'
    \}

    call s:Ruby.Register("comment", regex)
endfunction

"
function! s:tokens.RegisterFrozenString()
    let regex = #{search: '# frozen_string_literal: true'}

    call s:Ruby.Register("frozen_string", regex)
endfunction

"
function! s:tokens.RegisterMagicEncode()
    let regex = #{
        \body: named.snake_name,
        \search: '''# encoding: '' . body'
    \}

    call s:Ruby.Register("magic_encode", regex)
endfunction

"
function! s:tokens.RegisterMagicWarn()
    let regex = #{
        \body: named.snake_name,
        \search: '''# warn_indent: '' . body'
    \}

    call s:Ruby.Register("magic_warn", regex)
endfunction

"
function! s:tokens.RegisterMagicShare()
    let regex = #{
        \body: named.snake_name,
        \search: '''# shareable_constant_value: '' . body'
    \}

    call s:Ruby.Register("magic_share", regex)
endfunction
