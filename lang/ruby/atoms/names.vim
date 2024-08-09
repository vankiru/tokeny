let s:atoms = g:Ruby.atoms

"
" "\<\h\w*\>"
function! s:atoms.RegisterBaseName()
    let context = #{
        \anon: #{name: "\<\h\w*\>"},
        \ided: #{name: '"\<" . id . "\w*\>"'}
    \}

    self.Register("base_name", context, "name")
endfunction

"
" base_name
function! s:atoms.RegisterVariableName()
    let context = self.BuildContext(#{name: "base_name"})

    self.Register("variable_name", context, "name")
endfunction

"
" "@{base_name}"
function! s:atoms.RegisterInstanceVariableName()
    let context = self.BuildContext(#{name: "base_name"})

    self.Register("instance_variable_name", context, '"@" . name')
endfunction

"
" "@@{base_name}"
function! s:atoms.RegisterClassVariableName()
    let context = self.BuildContext(#{name: "base_name"})

    self.Register("class_variable_name", context, '"@@" . name')
endfunction

"
" "$\%({base_name}\|\d\+\|[!@_\.&~=\/\\*$?]\)"
function! s:atoms.RegisterGlobalName()
    let context = self.BuildContext(#{name: "base_name"})
    let regex = '"$\%(" . name . "\|\d\+\|[!@_\.&~=\/\\*$?]\)"'

    self.Register("global_name", context, regex)
endfunction

"
" "{base_name}[!?]\="
function! s:atoms.RegisterMethodName()
    let context = self.BuildContext(#{name: "base_name"})

    self.Register("method_name", context, 'name . "[!?]\="')
endfunction

"
" "\(@\|@@\|$\)\=$\%({base_name}\|\d\+\|[!@_\.&~=\/\\*$?]\)[!?]\="
function! s:atoms.RegisterSnakeName()
    let context = self.BuildContext(#{name: "base_name"})
    let regex = '"\(@\|@@\|$\)\=$\%(" . base_name . "\|\d\+\|[!@_\.&~=\/\\*$?]\)[!?]\="'

    self.Register("snake_name", context, regex)
endfunction

"
" "\<\u\(\u\|\d\|_\)*\>"
function! s:atoms.RegisterConstName()
    let context = #{
        \anon: #{name: "\<\u\(\u\|\d\|_\)*\>"},
        \ided: #{name: '"\<" . id . "\(\u\|\d\|_\)*\>"'}
    \}

    self.Register("snake_name", context, "name")
endfunction

"
" "\%(::\)\=\<\u\w*\>\%(::\<\u\w*\>\)*"
function! s:atoms.RegisterClassName()
    let context = #{
        \anon: #{name: "\%(::\)\=\<\u\w*\>\%(::\<\u\w*\>\)*"},
        \ided: #{name: '"\%(::\)\=\<" . id . "\w*\>\%(::\<\u\w*\>\)*"'}
    \}

    self.Register("snake_name", context, "name")
endfunction

"
" "\%({snake_name}\|{const_name}\|{class_name}\)"
function! s:atoms.RegisterClassName()
    let template = #{name: '"\%(" . snake_name . "\|" . const_name . "\|" . class_name "\)"'}
    let context = self.BuildContext(template)

    self.Register("snake_name", context, "name")
endfunction
