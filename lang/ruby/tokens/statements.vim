" "require '{id}.*'"
function! g:Ruby.tokens.RegisterRequire()
    let regex = #{
        \body: tags.path
        \token: "\<require\>\s\+[\"'']". body."[\"'']"
    \}

    call g:Ruby.Register("require", regex)
endfunction

"
" "undef {id}"
function! g:Ruby.tokens.RegisterUndef()
    let regex = #{
        \body: tags.method_name,
        \token: "\<undef\>\s\+".body
    \}

    call g:Ruby.Register("undef", regex)
endfunction

"
" "defined?({id})"
function! g:Ruby.tokens.RegisterDefined()
    let regex = #{
        \body: tags.name,
        \token: '\<defined?\>'.'\%(\s\+'.body.'\|('.body.')\)'
    \}

    call g:Ruby.Register("defined", regex)
endfunction

"
" "attr_reader {:id}.*"
function! g:Ruby.tokens.RegisterAttrReader()
    let regex = #{
        \body: tags.arts
        \token: "\<attr_reader\>".body
    \}

    call g:Ruby.Register("attr_reader", regex)
endfunction

"
" "attr_writer {id}.*"
function! g:Ruby.tokens.RegisterAttrWriter()
    let regex = #{
        \body: tags.arts
        \token: "\<attr_writer\>".body
    \}

    call g:Ruby.Register("attr_writer", regex)
endfunction

"
" "attr_accessor {id}.*"
function! g:Ruby.tokens.RegisterAttrAccessor()
    let regex = #{
        \body: tags.arts
        \token: "\<attr_accessor\>".body
    \}

    call g:Ruby.Register("attr_acessor", regex)
endfunction
