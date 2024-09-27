function! g:Ruby.tokens.RegisterNames()
    call g:Ruby.tokens.RegisterVariableName()
    call g:Ruby.tokens.RegisterInstanceVariableName()
    call g:Ruby.tokens.RegisterClassVariableName()
    call g:Ruby.tokens.RegisterGlobalName()
    call g:Ruby.tokens.RegisterMethodName()
    call g:Ruby.tokens.RegisterConstName()
    call g:Ruby.tokens.RegisterClassName()
    call g:Ruby.tokens.RegisterName()
endfunction

"
" {snake_name}
function! g:Ruby.tokens.RegisterVariableName()
    let input = #{
        \base: #{type: 'space', text: '{value}'}
    \}

    let search = #{
        \name: '{tags.snake_name}',
        \token: '\C{name}'
    \}

    let select = #{
    \}

    call g:Ruby.Register('variable_name', input, search, select)
endfunction

"
" @{snake_name}
function! g:Ruby.tokens.RegisterInstanceVariableName()
    let input = #{
        \base: #{type: 'space', text: '@{value}'}
    \}

    let search = #{
        \name: '{tags.snake_name}',
        \token: '\C@{name}'
    \}

    let select = #{
    \}

    call g:Ruby.Register('instance_variable_name', input, search, select)
endfunction

"
" @@{snake_name}
function! g:Ruby.tokens.RegisterClassVariableName()
    let input = #{
        \base: #{type: 'space', text: '@@{value}'}
    \}

    let search = #{
        \name: '{tags.snake_name}', 
        \token: '\C@@{name}'
    \}

    let select = #{
    \}

    call g:Ruby.Register('class_variable_name', input, search, select)
endfunction

"
" $\%({snake_name}\|\d\+\|[!@_\.&~=\/\\*$?]\)
function! g:Ruby.tokens.RegisterGlobalName()
    let input = #{
        \base: #{type: 'space', text: '${value}'}
    \}

    let search = #{
        \name: '{tags.snake_name}',
        \token: '\C$\%({name}\|\d\+\|[!@_\.&~=\/\\*$?]\)'
    \}

    let select = #{
    \}

    call g:Ruby.Register('global_name', input, search, select)
endfunction

"
" {snake_name}[!?]\=
function! g:Ruby.tokens.RegisterMethodName()
    let input = #{
        \base: #{type: 'space', text: '{value}'},
        \self: #{type: 'space', text: 'self.{value}'},
        \bang: #{type: 'space', text: '{value}!'},
        \plight: #{type: 'space', text: '{value}?'}
    \}

    let search = #{
        \name: 'tags.method_name}', 
        \token: '\C{name}'
    \}

    let select = #{
    \}

    call g:Ruby.Register('method_name', input, search, select)
endfunction

"
" {const_name}
function! g:Ruby.tokens.RegisterConstName()
    let input = #{
        \base: #{type: 'space', text: '{value}'}
    \}

    let search = #{
        \name: '{tags.const_name}', 
        \token: '\C{name}'
    \}

    let select = #{
    \}

    call g:Ruby.Register('const_name', input, search, select)
endfunction

"
" {class_name}
function! g:Ruby.tokens.RegisterClassName()
    let input = #{
        \base: #{type: 'space', text: '{value}'},
        \pack: #{type: 'space', text: '::{value}'}
    \}

    let search = #{
        \name: '{tags.class_name}',
        \token: '\C{name}'
    \}

    let select = #{
    \}

    call g:Ruby.Register('class_name', input, search, select)
endfunction

"
" \%({snake_name}\|{const_name}\|{class_name}\)
function! g:Ruby.tokens.RegisterName()
    let input = #{
        \base: #{type: 'space', text: '{value}'}
    \}

    let search = #{
        \name: '\%({tags.snake_name}\|{tags.const_name}\|{tags.class_name}\)',
        \token: '{name}'
    \}

    let select = #{
    \}

    call g:Ruby.Register('name', input, search, select)
endfunction
