" "require '{id}.*'"
function! s:tokens.RegisterRequire()
    let regex = #{
        \body: named.path
        \search: "\<require\>\s\+[\"'']". body."[\"'']"
    \}

    call s:Ruby.Register("require", regex)
endfunction

"
" "undef {id}"
function! s:tokens.RegisterUndef()
    let regex = #{
        \body: named.method_name,
        \search: "\<undef\>\s\+".body
    \}

    call s:Ruby.Register("undef", regex)
endfunction

"
" "defined?({id})"
function! s:tokens.RegisterDefined()
    let regex = #{
        \body: named.name,
        \search: '\<defined?\>'.'\%(\s\+'.body.'\|('.body.')\)'
    \}

    call s:Ruby.Register("defined", regex)
endfunction

"
" "attr_reader {:id}.*"
function! s:tokens.RegisterAttrReader()
    let regex = #{
        \body: named.arts
        \search: "\<attr_reader\>".body
    \}

    call s:Ruby.Register("attr_reader", regex)
endfunction

"
" "attr_writer {id}.*"
function! s:tokens.RegisterAttrWriter()
    let regex = #{
        \body: named.arts
        \search: "\<attr_writer\>".body
    \}

    call s:Ruby.Register("attr_writer", regex)
endfunction

"
" "attr_accessor {id}.*"
function! s:tokens.RegisterAttrAccessor()
    let regex = #{
        \body: named.arts
        \search: "\<attr_accessor\>".body
    \}

    call s:Ruby.Register("attr_acessor", regex)
endfunction
