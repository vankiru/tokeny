"
function! g:Ruby.tokens.RegisterClasses()
    call g:Ruby.tokens.RegisterClass()
    call g:Ruby.tokens.RegisterSuperClass()
    call g:Ruby.tokens.RegisterSelfClass()
    call g:Ruby.tokens.RegisterInitialize()
    call g:Ruby.tokens.RegisterNew()

    call g:Ruby.tokens.RegisterVisibility('private')
    call g:Ruby.tokens.RegisterVisibility('protected')
    call g:Ruby.tokens.RegisterVisibility('public')
endfunction

"
function! g:Ruby.tokens.RegisterClass()
    let input = #{
        \base: #{type: 'below', text: 'class {value}\nend'}
    \}

    let search = #{
        \name: '{tags.class_name}',
        \body: '{base.exp}',
        \token: '\<class\>\s\+{name}\n{body}'
    \}

     let select = #{
         \name: 'class_name',
         \body: 'i.block',
         \token: 'a.block'
     \}

    call g:Ruby.Register('class', input, search, select)
endfunction

"
function! g:Ruby.tokens.RegisterSuperClass()
    let input = #{
        \base: #{type: 'space', text: '< {value}'}
    \}

    let search = #{
        \name: '{tags.class_name}',
        \token: '\%(\<class\>\s\+{base.class_name}\)\@<=\s*<\s*{name}'
    \}

    let select = #{
        \name: 'class_name',
        \token: 'line'
    \}

    call g:Ruby.Register('super_class', input, search, select)
endfunction

"
function! g:Ruby.tokens.RegisterSelfClass()
    let input = #{
        \base: #{type: 'below', text: 'class << self\nend'}
    \}

    let search = #{
        \body: '{base.exp}',
        \token: '\<class\>\s*<<\s*\<self\>\n{body}'
    \}

    let select = #{
        \body: 'i.block',
        \token: 'a.block'
    \}

    call g:Ruby.Register('self_class', input, search, select)
endfunction

"
function! g:Ruby.tokens.RegisterInitialize()
    let input = #{
        \base: #{type: 'below', text: 'def initialize\nend'}
    \}

    let search = #{
        \body: '{base.exp}',
        \token: '\<def\>\s*\<initialize\>{base.arts}\n{body}'
    \}

    let select = #{
        \body: 'i.block',
        \token: 'a.block'
    \}

    call g:Ruby.Register('initialize', input, search, select)
endfunction

"
function! g:Ruby.tokens.RegisterNew()
    let input = #{
        \base: #{type: "space", text: "{value}.new"}
    \}

    let search = #{
        \name: '{tags.class_name}',
        \body: '{base.arts}',
        \token: '{name}\.new{body}'
    \}

    let select = #{
        \name: 'class_name',
        \body: 'i.arts',
        \token: ''
    \}

    call g:Ruby.Register('new', input, search, select)
endfunction

"
function! g:Ruby.tokens.RegisterVisibility(type)
    let input = #{
        \base: #{type: 'below', text: a:type},
    \}

    let search = #{
        \body: '{tags.arts}',
        \token: '\<'.a:type.'\>{body}'
    \}

    let select = #{
        \body: 'line',
        \token: 'line'
    \}

    call g:Ruby.Register('private', input, search, select)
endfunction
