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
    let input = #{
        \base: #{type: 'below', text: 'require "{value}"', move: 1}
    \}

    let search = #{
        \body: '{tags.path}',
        \token: '\<require\>\s\+"{body}"'
    \}

    let select = #{
    \}

    call g:Ruby.Register('require', input, search, select)
endfunction

"
" undef {method_name}
function! g:Ruby.tokens.RegisterUndef()
    let input = #{
        \base: #{type: 'space', text: 'undef {value}'}
    \}

    let search = #{
        \body: '{tags.method_name}',
        \token: '\<undef\>\s\+{body}'
    \}

    let select = #{
    \}

    call g:Ruby.Register('undef', input, search, select)
endfunction

"
" defined?({name})
" defined? {name}
function! g:Ruby.tokens.RegisterDefined()
    let input = #{
        \base: #{type: 'space', text: 'define?({value})', move: 1}
    \}

    let search = #{
        \body: '{tags.name}',
        \token: '\<defined\>?\%(\s\+{body}\|({body})\)'
    \}
    
    let select = #{
    \}

    call g:Ruby.Register('defined', input, search, select)
endfunction

"
" attr_reader {arts}
" attr_writer {arts}
" attr_accessor {arts}
function! g:Ruby.tokens.RegisterAttr(name)
    let input = #{
        \base: #{type: 'space', text: 'attr_'.a:name}
    \}

    let search = #{
        \body: '{tags.exp}',
        \token: '\<attr_'.a:name.'\>\s\+{body}'
    \}
    
    let select = #{
    \}

    call g:Ruby.Register('attr_'.a:name, input, search, select)
endfunction
