"
" "\<\h\w*\>"
function! g:Ruby.tokens.RegisterVariableName()
    let regex = #{name: s:atoms.snake_name, token: 'name'}

    call g:Ruby.Register("variable_name", regex)
endfunction

"
" "@{snake_name}"
function! g:Ruby.tokens.RegisterInstanceVariableName()
    let regex = #{name: s:atoms.snake_name, token: '''@'' . name'}

    call g:Ruby.Register("instance_variable_name", regex)
endfunction

"
" "@@{snake_name}"
function! g:Ruby.tokens.RegisterClassVariableName()
    let regex = #{name: s:atoms.snake_name, token: '''@@'' . name'}

    call g:Ruby.Register("class_variable_name", regex)
endfunction

"
" "$\%({snake_name}\|\d\+\|[!@_\.&~=\/\\*$?]\)"
function! g:Ruby.tokens.RegisterGlobalName()
    let regex = #{
        \name: s:atoms.snake_name,
        \token: '''$\%('' . name . ''\|\d\+\|[!@_\.&~=\/\\*$?]\)'''
    \}

    call g:Ruby.Register("global_name", regex)
endfunction

"
" "{snake_name}[!?]\="
function! g:Ruby.tokens.RegisterMethodName()
    let regex = #{name: s:atoms.method_name, token: 'name'}

    call g:Ruby.Register("method_name", regex)
endfunction

"
" "\<\u\(\u\|\d\|_\)*\>"
function! g:Ruby.tokens.RegisterConstName()
    let regex = #{name: s:atoms.const_name, token: 'name'}

    call g:Ruby.Register("const_name", regex)
endfunction

"
" "\%(::\)\=\<\u\w*\>\%(::\<\u\w*\>\)*"
function! g:Ruby.tokens.RegisterClassName()
    let regex = #{name: s:atoms.class_name, token: 'name'}

    call g:Ruby.Register("class_name", regex)
endfunction

"
" "\(@\|@@\|$\)\=$\%({snake_name}\|\d\+\|[!@_\.&~=\/\\*$?]\)[!?]\="
"function! g:Ruby.tokens.RegisterSnakeName()
    "let regex = #{
        "\name: "atoms.snake_name",
        "\token: '"\(@\|@@\|$\)\=$\%(" . name . "\|\d\+\|[!@_\.&~=\/\\*$?]\)[!?]\="'
    "\}

    "call g:Ruby.Register("snake_name", regex)
"endfunction

"
 "\%({snake_name}\|{const_name}\|{class_name}\)"
"function! g:Ruby.tokens.RegisterName()
    "for atom in ["snake_name", "const_name", "class_name"]
      "execute("let " . atom . " = self." . atom . ".params.name")
    "endfor

    "let snake_name = self.snake_name.params.name
    "let const_name = self.const_name.params.name
    "let class_name = self.class_name.params.name

    "let regex = #{
        "\name: "\%(" . self.snake_name . "\|" . self.const_name . "\|" . self.class_name "\)",
        "\name: "\%(" . self.snake_name.params.name . "\|" . self.const_name.params.name . "\|" . self.class_name.params.name "\)",
        "\name: '"\%(" . names.snake_name . "\|" . names.const_name . "\|" . names.class_name "\)"',
        "\name: self.BuildParam("name", '"\%(" . snake_name . "\|" . const_name . "\|" . class_name "\)"')
      
        "\token: "name"
    "\}

    "call g:Ruby.Register("snake_name", regex)
"endfunction
