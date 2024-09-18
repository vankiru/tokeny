"
function! g:Ruby.tokens.RegisterClasses()
    call g:Ruby.tokens.RegisterClass()
    call g:Ruby.tokens.RegisterSuperClass()
    call g:Ruby.tokens.RegisterSelfClass()
    call g:Ruby.tokens.RegisterInitialize()
    call g:Ruby.tokens.RegisterPrivate()
    call g:Ruby.tokens.RegisterProtected()
    call g:Ruby.tokens.RegisterPublic()
    call g:Ruby.tokens.RegisterNew()
endfunction

"
function! g:Ruby.tokens.RegisterClass()
    let regex = #{
        \name: '{tags.class_name}',
        \body: '{base.exp}',
        \token: '\<class\>\s\+{name}\n{body}'
    \}

     let select = #{
         \name: 'class_name',
         \body: 'i.block',
         \token: 'a.block'
     \}

    call g:Ruby.Register('class', regex, select)
endfunction

"
function! g:Ruby.tokens.RegisterSuperClass()
    let regex = #{
        \name: '{tags.class_name}',
        \token: '\%(\<class\>\s\+{base.class_name}\)\@<=\s*<\s*{name}'
    \}

    let select = #{
        \name: 'class_name',
        \token: 'line'
    \}

    call g:Ruby.Register('super_class', regex, select)
endfunction

"
function! g:Ruby.tokens.RegisterSelfClass()
    let regex = #{
        \body: '{base.exp}',
        \token: '\<class\>\s*<<\s*\<self\>\n{body}'
    \}

    let select = #{
        \body: 'i.block',
        \token: 'a.block'
    \}

    call g:Ruby.Register('self_class', regex, select)
endfunction

"
function! g:Ruby.tokens.RegisterInitialize()
    let regex = #{
        \body: '{base.exp}',
        \token: '\<def\>\s*\<initialize\>{base.arts}\n{body}'
    \}

    let select = #{
        \body: 'i.block',
        \token: 'a.block'
    \}

    call g:Ruby.Register('initialize', regex, select)
endfunction

"
function! g:Ruby.tokens.RegisterPrivate()
    let regex = #{
        \body: '{tags.arts}',
        \token: '\<private\>{body}'
    \}

    let select = #{
        \body: 'line',
        \token: 'line'
    \}

    call g:Ruby.Register('private', regex, select)
endfunction

"
function! g:Ruby.tokens.RegisterProtected()
    let regex = #{
        \body: '{tags.arts}',
        \token: '\<protected\>{body}'
    \}

    let select = #{
        \body: 'line',
        \token: 'line'
    \}

    call g:Ruby.Register('protected', regex, select)
endfunction

"
function! g:Ruby.tokens.RegisterPublic()
    let regex = #{
        \body: '{tags.arts}',
        \token: '\<public\>{body}'
    \}

    let select = #{
        \body: 'line',
        \token: 'line'
    \}

    call g:Ruby.Register('public', regex, select)
endfunction

"
function! g:Ruby.tokens.RegisterNew()
    let regex = #{
        \name: '{tags.class_name}',
        \body: '{base.arts}',
        \token: '{name}\.new{body}'
    \}

    let select = #{
        \name: 'class_name',
        \body: 'i.arts',
        \token: ''
    \}

    call g:Ruby.Register('new', regex, select)
endfunction
