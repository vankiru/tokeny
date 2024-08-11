let s:Ruby = g:Ruby

let s:tokens = g:Ruby.tokens
let s:atoms = s:Ruby.atoms.named

"
" "\<\h\w*\>"
function! s:tokens.RegisterVariableName()
    let regex = #{name: s:atoms.snake_name, search: 'name'}

    call s:Ruby.Register("variable_name", regex)
endfunction

"
" "@{snake_name}"
function! s:tokens.RegisterInstanceVariableName()
    let regex = #{name: s:atoms.snake_name, search: '''@'' . name'}

    call s:Ruby.Register("instance_variable_name", regex)
endfunction

"
" "@@{snake_name}"
function! s:tokens.RegisterClassVariableName()
    let regex = #{name: s:atoms.snake_name, search: '''@@'' . name'}

    call s:Ruby.Register("class_variable_name", regex)
endfunction

"
" "$\%({snake_name}\|\d\+\|[!@_\.&~=\/\\*$?]\)"
function! s:tokens.RegisterGlobalName()
    let regex = #{
        \name: s:atoms.snake_name,
        \search: '''$\%('' . name . ''\|\d\+\|[!@_\.&~=\/\\*$?]\)'''
    \}

    call s:Ruby.Register("global_name", regex)
endfunction

"
" "{snake_name}[!?]\="
function! s:tokens.RegisterMethodName()
    let regex = #{name: s:atoms.method_name, search: 'name'}

    call s:Ruby.Register("method_name", regex)
endfunction

"
" "\<\u\(\u\|\d\|_\)*\>"
function! s:tokens.RegisterConstName()
    let regex = #{name: s:atoms.const_name, search: 'name'}

    call s:Ruby.Register("const_name", regex)
endfunction

"
" "\%(::\)\=\<\u\w*\>\%(::\<\u\w*\>\)*"
function! s:tokens.RegisterClassName()
    let regex = #{name: s:atoms.class_name, search: 'name'}

    call s:Ruby.Register("class_name", regex)
endfunction

"
" "\(@\|@@\|$\)\=$\%({snake_name}\|\d\+\|[!@_\.&~=\/\\*$?]\)[!?]\="
"function! s:tokens.RegisterSnakeName()
    "let regex = #{
        "\name: "atoms.snake_name",
        "\search: '"\(@\|@@\|$\)\=$\%(" . name . "\|\d\+\|[!@_\.&~=\/\\*$?]\)[!?]\="'
    "\}

    "call s:Ruby.Register("snake_name", regex)
"endfunction

"
 "\%({snake_name}\|{const_name}\|{class_name}\)"
"function! s:tokens.RegisterName()
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
      
        "\search: "name"
    "\}

    "call s:Ruby.Register("snake_name", regex)
"endfunction
