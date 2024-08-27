let s:Ruby = g:Ruby
  
"
function! s:Ruby.tokens.RegisterClass()
    let regex = #{
        \name: id.class_name,
        \body: base.body,
        \token: "\<class\>\s\+".name.body
    \}

     let select = #{
         \name: "class_name",
         \body: "i.block",
         \token: "a.block"
     \}

    call s:Ruby.Register("class", regex, select)
endfunction

"
function! s:Ruby.tokens.RegisterSuperClass()
    let regex = #{
        \name: id.class_name,
        \token: "\%(\<class\>\s\+".base.class_name."\)@<=\s\*<\s*".name
    \}

    let select = #{
        \name: "class_name",
        \token: "line"
    \}

    call s:Ruby.Register("super_class", regex, select)
endfunction

"
function! s:Ruby.tokens.RegisterSelfClass()
    let regex = #{
        \body: base.body,
        \token: "\<class\>\s\*<<\s*\<self\>".body
    \}

    let select = #{
        \body: "i.block",
        \token: "a.block"
    \}

    call s:Ruby.Register("self_class", regex, select)
endfunction

"
function! s:Ruby.tokens.RegisterClassInit()
    let regex = #{
        \body: base.body,
        \token: "\<def\>\s*\<initialize\>".base.arts.body
    \}

    let select = #{
        \body: "i.block",
        \token: "a.block"
    \}

    call s:Ruby.Register("class_init", regex, select)
endfunction

"
function! s:Ruby.tokens.RegisterPrivate()
    let regex = #{
        \body: id.arts,
        \token: "\<private\>".body
    \}

    let select = #{
        \body: "line",
        \token: "line"
    \}

    call s:Ruby.Register("private", regex, select)
endfunction

"
function! s:Ruby.tokens.RegisterProtected()
    let regex = #{
        \body: id.arts,
        \token: "\<protected\>".body
    \}

    let select = #{
        \body: "line",
        \token: "line"
    \}

    call s:Ruby.Register("protected", regex, select)
endfunction

"
function! s:Ruby.tokens.RegisterPublic()
    let regex = #{
        \body: id.arts,
        \token: "\<public\>".body
    \}

    let select = #{
        \body: "line",
        \token: "line"
    \}

    call s:Ruby.Register("public", regex, select)
endfunction

"
function! s:Ruby.tokens.RegisterNew()
    let regex = #{
        \name: id.class_name,
        \body: base.arts,
        \token: name.".new".body
    \}

    let select = #{
        \name: "class_name",
        \body: "i.arts"
        \token: ""
    \}

    call s:Ruby.Register("new", regex, select)
endfunction
