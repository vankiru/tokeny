" "require": {
"     "search_regex": 'require "{id}.*"'
" },
function! s:tokens.RegisterRequire()
    let regex = #{
        \search: ''
    \}

    call s:Ruby.Register("require", regex)
endfunction

"
" "unbind": {
"     "search_regex": "undef {id}"
" },
function! s:tokens.RegisterUnbind()
    let regex = #{
        \search: ''
    \}

    call s:Ruby.Register("unbind", regex)
endfunction

"
" "defined": {
"     "search_regex": "defined?({id})
" },
function! s:tokens.RegisterDefined()
    let regex = #{
        \search: ''
    \}

    call s:Ruby.Register("defined", regex)
endfunction

"
" "art read": {
"     "search_regex": "attr_reader "
" },
function! s:tokens.RegisterAttrReader()
    let regex = #{
        \search: ''
    \}

    call s:Ruby.Register("attr_reader", regex)
endfunction

"
" "art write": {
"     "search_regex": "attr_writer "
" },
function! s:tokens.RegisterAttrWriter()
    let regex = #{
        \search: ''
    \}

    call s:Ruby.Register("attr_writer", regex)
endfunction

"
" "art access": {
"     "search_regex": "attr_accessor "
" },
function! s:tokens.RegisterAttrAccessor()
    let regex = #{
        \search: ''
    \}

    call s:Ruby.Register("attr_acessor", regex)
endfunction
