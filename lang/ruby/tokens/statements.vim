function! g:Ruby.tokens.RegisterStatements()
    call g:Ruby.tokens.RegisterRequire()
    call g:Ruby.tokens.RegisterUndef()
    call g:Ruby.tokens.RegisterDefined()

    call g:Ruby.tokens.RegisterAttr('reader')
    call g:Ruby.tokens.RegisterAttr('writer')
    call g:Ruby.tokens.RegisterAttr('accessor')
endfunction

"
" require {path}
function! g:Ruby.tokens.RegisterRequire()
    let regex = #{
        \body: '{tags.path}',
        \token: '\<require\>\s\+"{body}"'
    \}

    let select = #{
    \}

    call g:Ruby.Register('require', regex, select)
endfunction

"
" undef {method_name}
function! g:Ruby.tokens.RegisterUndef()
    let regex = #{
        \body: '{tags.method_name}',
        \token: '\<undef\>\s\+{body}'
    \}

    let select = #{
    \}

    call g:Ruby.Register('undef', regex, select)
endfunction

"
" defined?({name})
" defined? {name}
function! g:Ruby.tokens.RegisterDefined()
    let regex = #{
        \body: '{tags.name}',
        \token: '\<defined\>?\%(\s\+{body}\|({body})\)'
    \}
    
    let select = #{
    \}

    call g:Ruby.Register('defined', regex, select)
endfunction

"
" attr_reader {arts}
" attr_writer {arts}
" attr_accessor {arts}
function! g:Ruby.tokens.RegisterAttr(name)
    let regex = #{
        \body: '{tags.exp}',
        \token: '\<attr_'.a:name.'\>\s\+{body}'
    \}
    
    let select = #{
    \}

    call g:Ruby.Register('attr_'.a:name, regex, select)
endfunction
