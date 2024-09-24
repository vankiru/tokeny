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
    let input = #{
        \base: #{type: 'space', text: '# {value}'},
        \multi: #{type: 'below', text: '=begin\n{value}\n=end'}
    \}

    let line = '\s*#[^{]\s*{body}'
    let multi = '=begin\n{body}[.|\n]\{-}=end'

    let search = #{
        \body: '{tags.text}',
        \token: '\%('.line.'\|'.multi.'\)'
    \}

    let select = #{
        \body: 'line',
        \token: 'line'
    \}

    call g:Ruby.Register('comment', input, search, select)
endfunction

"
function! g:Ruby.tokens.RegisterFrozenString()
    let input = #{
        \base: #{type: 'below', text: '# frozen_strin_literal: true'},
    \}
    let search = #{token: '# frozen_string_literal:'}
    let select = #{token: 'line'}

    call g:Ruby.Register('frozen_string', input, search, select)
endfunction

"
function! g:Ruby.tokens.RegisterMagicEncode()
    let input = #{
        \base: #{type: 'below', text: '# encoding: {value}'}
    \}

    let search = #{
        \body: '{tags.snake_name}',
        \token: '# encoding: {body}'
    \}

    let select = #{
        \body: 'line',
        \token: 'line'
    \}

    call g:Ruby.Register('magic_encode', input, search, select)
endfunction

"
function! g:Ruby.tokens.RegisterMagicWarn()
    let input = #{
        \base: #{type: 'below', text: '# warn_indent: {value}'}
    \}

    let search = #{
        \body: '{tags.snake_name}',
        \token: '# warn_indent: {body}'
    \}

    let select = #{
        \body: 'line',
        \token: 'line'
    \}

    call g:Ruby.Register('magic_warn', input, search, select)
endfunction

"
function! g:Ruby.tokens.RegisterMagicShare()
    let input = #{
        \base: #{type: 'below', text: '# shareable_constant_value: {value}'}
    \}

    let search = #{
        \body: '{tags.snake_name}',
        \token: '# shareable_constant_value: {body}'
    \}

    let select = #{
        \body: 'line',
        \token: 'line'
    \}

    call g:Ruby.Register('magic_share', input, search, select)
endfunction
