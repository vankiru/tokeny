"
function! g:Ruby.tokens.RegisterModules()
    call g:Ruby.tokens.RegisterDefineModule('module')
    call g:Ruby.tokens.RegisterDefineModule('refine')

    call g:Ruby.tokens.RegisterImportModule('include')
    call g:Ruby.tokens.RegisterImportModule('extend')
    call g:Ruby.tokens.RegisterImportModule('using')
endfunction

" <module/refine> {class_name}
" {body}
" end
function! g:Ruby.tokens.RegisterDefineModule(name)
    let regex = #{
        \name: '{tags.class_name}',
        \body: '{base.exp}',
        \token: '\<'.a:name.'\>\s\+{name}\n{body}'
    \}

    let select = #{
    \}

    call g:Ruby.Register(a:name, regex, select)
endfunction

"
" <include/extend/using> {class_name}
function! g:Ruby.tokens.RegisterImportModule(name)
    let regex = #{
        \name: '{tags.class_name}',
        \token: '\<'.a:name.'\>\s\+{name}'
    \}

    let select = #{
    \}

    call g:Ruby.Register(a:name, regex, select)
endfunction
