"
function! g:Ruby.tokens.RegisterComments()
    call g:Ruby.tokens.RegisterComment()
    call g:Ruby.tokens.RegisterFrozenString()
    call g:Ruby.tokens.RegisterMagicEncode()
    call g:Ruby.tokens.RegisterMagicWarn()
    call g:Ruby.tokens.RegisterMagicShare()
endfunction

"
function! g:Ruby.tokens.RegisterComment()
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

    call g:Ruby.Register('comment', regex, select)
endfunction

"
function! g:Ruby.tokens.RegisterFrozenString()
    let regex = #{token: '# frozen_string_literal: true'}
    let select = #{token: 'line'}

    call g:Ruby.Register('frozen_string', regex, select)
endfunction

"
function! g:Ruby.tokens.RegisterMagicEncode()
    let regex = #{
        \body: '{tags.snake_name}',
        \token: '# encoding: {body}'
    \}

    let select = #{
        \body: 'line',
        \token: 'line'
    \}

    call g:Ruby.Register('magic_encode', regex, select)
endfunction

"
function! g:Ruby.tokens.RegisterMagicWarn()
    let regex = #{
        \body: '{tags.snake_name}',
        \token: '# warn_indent: {body}'
    \}

    let select = #{
        \body: 'line',
        \token: 'line'
    \}

    call g:Ruby.Register('magic_warn', regex, select)
endfunction

"
function! g:Ruby.tokens.RegisterMagicShare()
    let regex = #{
        \body: '{tags.snake_name}',
        \token: '# shareable_constant_value: {body}'
    \}

    let select = #{
        \body: 'line',
        \token: 'line'
    \}

    call g:Ruby.Register('magic_share', regex, select)
endfunction
