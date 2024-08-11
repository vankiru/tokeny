let s:Ruby = g:Ruby
  
let s:commands = g:Ruby.commands
let s:tokens = g:Ruby.tokens
let s:atoms = s:Ruby.atoms.noname

"
function! s:tokens.RegisterClass()
    let regex = #{
        \name: named.class_name,
        \search: '''\<class\>\s\+'' . name'
    \}

     let commands = #{
         \change: s:commands.ChangeBlock(),
         \chunk: s:commands.ChunkBlock()
     \}

    call s:Ruby.Register("class", regex, commands)
endfunction

"
function! s:tokens.RegisterSuperClass()
    let regex = #{
        \name: named.class_name,
        \search: '''\<class\>\s\+''' . noname.name . '''\s\*<\s*'' . name'
    \}

    call s:Ruby.Register("super_class", regex)
endfunction

"
function! s:tokens.RegisterSelfClass()
    let regex = #{search: '\<class\>\s\*<<\s*\<self\>'}

    let commands = #{
        \change: s:commands.ChangeBlock(),
        \chunk: s:commands.ChunkBlock()
    \}

    call s:Ruby.Register("self_class", regex, commands)
endfunction

"
function! s:tokens.RegisterClassInit()
    let regex = #{search: '\<def\>\s*\<initialize\>' . noname.arts}

    let commands = #{
        \change: s:commands.ChangeBlock(),
        \chunk: s:commands.ChunkBlock()
    \}

    call s:Ruby.Register("class_init", regex, commands)
endfunction

"
function! s:tokens.RegisterPrivate()
    let regex = #{
        \body: named.arts,
        \search: '''\<private\>'' . body'
    \}

    call s:Ruby.Register("private", regex)
endfunction

"
function! s:tokens.RegisterProtected()
    let regex = #{
        \body: named.arts,
        \search: '''\<protected\>'' . body'
    \}

    call s:Ruby.Register("protected", regex)
endfunction

"
function! s:tokens.RegisterPublic()
    let regex = #{
        \body: named.arts,
        \search: '''\<public\>'' . body'
    \}

    call s:Ruby.Register("public", regex)
endfunction

"
function! s:tokens.RegisterNew()
    let regex = #{
        \name: named.class_name,
        \body: noname.arts,
        \search: 'name . ''.new'' . body'
    \}

    call s:Ruby.Register("new", regex)
endfunction
