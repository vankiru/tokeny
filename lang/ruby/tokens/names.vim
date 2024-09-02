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
    let regex = #{
        \name: '{tags.snake_name}',
        \token: '\C{name}'
    \}

    let select = #{
    \}

    call g:Ruby.Register('variable_name', regex, select)
endfunction

"
" @{snake_name}
function! g:Ruby.tokens.RegisterInstanceVariableName()
    let regex = #{
        \name: '{tags.snake_name}',
        \token: '\C@{name}'
    \}

    let select = #{
    \}

    call g:Ruby.Register('instance_variable_name', regex, select)
endfunction

"
" @@{snake_name}
function! g:Ruby.tokens.RegisterClassVariableName()
    let regex = #{
        \name: '{tags.snake_name}', 
        \token: '\C@@{name}'
    \}

    let select = #{
    \}

    call g:Ruby.Register('class_variable_name', regex, select)
endfunction

"
" $\%({snake_name}\|\d\+\|[!@_\.&~=\/\\*$?]\)
function! g:Ruby.tokens.RegisterGlobalName()
    let regex = #{
        \name: '{tags.snake_name}',
        \token: '\C$\%({name}\|\d\+\|[!@_\.&~=\/\\*$?]\)'
    \}

    let select = #{
    \}

    call g:Ruby.Register('global_name', regex, select)
endfunction

"
" {snake_name}[!?]\=
function! g:Ruby.tokens.RegisterMethodName()
    let regex = #{
        \name: 'tags.method_name}', 
        \token: '\C{name}'
    \}

    let select = #{
    \}

    call g:Ruby.Register('method_name', regex, select)
endfunction

"
" {const_name}
function! g:Ruby.tokens.RegisterConstName()
    let regex = #{
        \name: '{tags.const_name}', 
        \token: '\C{name}'
    \}

    let select = #{
    \}

    call g:Ruby.Register('const_name', regex, select)
endfunction

"
" {class_name}
function! g:Ruby.tokens.RegisterClassName()
    let regex = #{
        \name: '{tags.class_name}',
        \token: '\C{name}'
    \}

    let select = #{
    \}

    call g:Ruby.Register('class_name', regex, select)
endfunction

"
" \%({snake_name}\|{const_name}\|{class_name}\)
function! g:Ruby.tokens.RegisterName()
    let regex = #{
        \name: '\%({tags.snake_name}\|{tags.const_name}\|{tags.class_name}\)',
        \token: '{name}'
    \}

    let select = #{
    \}

    call g:Ruby.Register('name', regex, select)
endfunction
