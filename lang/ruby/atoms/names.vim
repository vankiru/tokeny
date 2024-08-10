let s:Ruby = g:Ruby
let s:atoms = g:Ruby.atoms

"
" "\<\h\w*\>"
function! s:atoms.RegisterVariableName()
    let params = #{name: '"\<" . id . "\w*\>"', search: "name"}

    call s:Ruby.RegisterAtom("variable_name", params)
endfunction

"
" "@{variable_name}"
function! s:atoms.RegisterInstanceVariableName()
    let params = #{
        \name: self.variable_name.params.name,
        \search: '"@" . name'
    \}

    call s:Ruby.RegisterAtom("instance_variable_name", params)
endfunction

"
" "@@{variable_name}"
function! s:atoms.RegisterClassVariableName()
    let params = #{
        \name: self.variable_name.params.name,
        \search: '"@@" . name'
    \}

    call s:Ruby.RegisterAtom("class_variable_name", params)
endfunction

"
" "$\%({variable_name}\|\d\+\|[!@_\.&~=\/\\*$?]\)"
function! s:atoms.RegisterGlobalName()
    let params = #{
        \name: self.variable_name.params.name,
        \search: '"$\%(" . name . "\|\d\+\|[!@_\.&~=\/\\*$?]\)"'
    \}

    call s:Ruby.RegisterAtom("global_name", params)
endfunction

"
" "{variable_name}[!?]\="
function! s:atoms.RegisterMethodName()
    let params = #{
        \name: self.variable_name.params.name,
        \search: 'name . "[!?]\="'
    \}

    call s:Ruby.RegisterAtom("method_name", params)
endfunction

"
" "\(@\|@@\|$\)\=$\%({variable_name}\|\d\+\|[!@_\.&~=\/\\*$?]\)[!?]\="
function! s:atoms.RegisterSnakeName()
    let params = #{
        \name: self.variable_name.params.name,
        \search: '"\(@\|@@\|$\)\=$\%(" . name . "\|\d\+\|[!@_\.&~=\/\\*$?]\)[!?]\="'
    \}

    call s:Ruby.RegisterAtom("snake_name", params)
endfunction

"
" "\<\u\(\u\|\d\|_\)*\>"
function! s:atoms.RegisterConstName()
    let params = #{
        \name: '"\<" . id . "\(\u\|\d\|_\)*\>"',
        \search: "name"
    \}

    call s:Ruby.RegisterAtom("const_name", params)
endfunction

"
" "\%(::\)\=\<\u\w*\>\%(::\<\u\w*\>\)*"
function! s:atoms.RegisterClassName()
    let params = #{
        \name: '"\%(::\)\=\<" . id . "\w*\>\%(::\<\u\w*\>\)*"',
        \search: "name"
    \}

    call s:Ruby.RegisterAtom("class_name", params)
endfunction
