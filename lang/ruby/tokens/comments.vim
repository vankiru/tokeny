let s:Ruby = g:Ruby

"
function! s:Ruby.tokens.RegisterComment()
    let line = '\s*#[^{]\s*{body}'
    let multi = '=begin\n{body}[.|\n]\{-}=end'

    let regex = #{
        \body: '{tags.text}',
        \token: '\%('.line.'\|'.multi.'\)'
    \}

    let select = #{
        \body: 'line',
        \token: 'line'
    \}

    call s:Ruby.Register('comment', regex, select)
endfunction

"
function! s:Ruby.tokens.RegisterFrozenString()
    let regex = #{token: '# frozen_string_literal: true'}
    let select = #{token: 'line'}

    call s:Ruby.Register('frozen_string', regex, select)
endfunction

"
function! s:Ruby.tokens.RegisterMagicEncode()
    let regex = #{
        \body: '{tags.snake_name}',
        \token: '# encoding: {body}'
    \}

    let select = #{
        \body: 'line',
        \token: 'line'
    \}

    call s:Ruby.Register('magic_encode', regex, select)
endfunction

"
function! s:Ruby.tokens.RegisterMagicWarn()
    let regex = #{
        \body: '{tags.snake_name}',
        \token: '# warn_indent: {body}'
    \}

    let select = #{
        \body: 'line',
        \token: 'line'
    \}

    call s:Ruby.Register('magic_warn', regex, select)
endfunction

"
function! s:Ruby.tokens.RegisterMagicShare()
    let regex = #{
        \body: '{tags.snake_name}',
        \token: '# shareable_constant_value: {body}'
    \}

    let select = #{
        \body: 'line',
        \token: 'line'
    \}

    call s:Ruby.Register('magic_share', regex, select)
endfunction
