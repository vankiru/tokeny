let s:atoms = g:Ruby.atoms

"
" "\<\h\w*\>"
function! s:atoms.RegisterBaseName()
    let context = #{name: '"\<" . id . "\w*\>"'}

    self.Register("base_name", context, "name")
endfunction

"
" base_name
function! s:atoms.RegisterVariableName()
    let context = #{name: self.base_name}

    self.Register("variable_name", context, "name")
endfunction

"
" "@{base_name}"
function! s:atoms.RegisterInstanceVariableName()
    let context = #{name: self.base_name}

    self.Register("instance_variable_name", context, '"@" . name')
endfunction

"
" "@@{base_name}"
function! s:atoms.RegisterClassVariableName()
    let context = #{name: self.base_name}

    self.Register("class_variable_name", context, '"@@" . name')
endfunction

"
" "$\%({base_name}\|\d\+\|[!@_\.&~=\/\\*$?]\)"
function! s:atoms.RegisterGlobalName()
    let context = #{name: self.base_name}
    let regex = '"$\%(" . name . "\|\d\+\|[!@_\.&~=\/\\*$?]\)"'

    self.Register("global_name", context, regex)
endfunction

"
" "{base_name}[!?]\="
function! s:atoms.RegisterMethodName()
    let context = #{name: self.base_name}

    self.Register("method_name", context, 'name . "[!?]\="')
endfunction

"
" "\(@\|@@\|$\)\=$\%({base_name}\|\d\+\|[!@_\.&~=\/\\*$?]\)[!?]\="
function! s:atoms.RegisterSnakeName()
    let context = #{name: self.base_name}
    let regex = '"\(@\|@@\|$\)\=$\%(" . base_name . "\|\d\+\|[!@_\.&~=\/\\*$?]\)[!?]\="'

    self.Register("snake_name", context, regex)
endfunction

"
" "\<\u\(\u\|\d\|_\)*\>"
function! s:atoms.RegisterConstName()
    let context = #{name: '"\<" . id . "\(\u\|\d\|_\)*\>"'}

    self.Register("snake_name", context, "name")
endfunction

"
" "\%(::\)\=\<\u\w*\>\%(::\<\u\w*\>\)*"
function! s:atoms.RegisterClassName()
    let context = #{name: '"\%(::\)\=\<" . id . "\w*\>\%(::\<\u\w*\>\)*"'}

    self.Register("snake_name", context, "name")
endfunction

"
" "\%({snake_name}\|{const_name}\|{class_name}\)"
function! s:atoms.RegisterName()
    let context = #{name: "\%(" . self.snake_name . "\|" . self.const_name . "\|" . self.class_name "\)"}

    self.Register("snake_name", context, "name")
endfunction
