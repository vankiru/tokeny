"
" met: {
"     "type": "line,block",
"     "id_type": "snake_name",
"     "search_regex": "\(un\)\@<!def {id}.*",
"     "name_regex": "\(un\)\@<!def \zs{id}\w*[!?]\?\ze\((.*)\)\?",
"     "body_regex": "\(un\)\@<!def {id}\w*[!?]\?\((.*)\)\?"
" },
function! s:tokens.RegisterMethod()
    let regex = #{
        \search: ''
    \}

    call s:Ruby.Register("method", regex)
endfunction

"
"call: {
"   "type": "none",
"   "id_type": "none",
"   "search_regex": ".{id}",
"},
" "safe call": {
"     "type": "none",
"     "id_type": "none",
"     "search_regex": "&.{id}",
" },
function! s:tokens.RegisterCall()
    let regex = #{
        \search: ''
    \}

    call s:Ruby.Register("call", regex)
endfunction

"
" "return": {
"     "type": "none",
"     "id_type": "none",
"     "search_regex": "return",
" },
function! s:tokens.RegisterReturn()
    let regex = #{
        \search: ''
    \}

    call s:Ruby.Register("return", regex)
endfunction

"
" "parent": {
"     "type": "none",
"     "id_type": "none",
"     "search_regex": "super",
" },
function! s:tokens.RegisterSuper()
    let regex = #{
        \search: ''
    \}

    call s:Ruby.Register("super", regex)
endfunction

"
" "yeild": {
"     "type": "none",
"     "id_type": "none",
"     "search_regex": "yield",
"     "search_regex": "yeild self",
" },
function! s:tokens.RegisterYield()
    let regex = #{
        \search: ''
    \}

    call s:Ruby.Register("super", regex)
endfunction
