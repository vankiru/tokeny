" "module": {
"     "search_regex": "module {id}",
" },
function! s:tokens.RegisterModule()
    let regex = #{
        \search: ''
    \}

    call s:Ruby.Register("module", regex)
endfunction

"
" "refine": {
"     "search_regex": "refine {id}",
" },
function! s:tokens.RegisterRefine()
    let regex = #{
        \search: ''
    \}

    call s:Ruby.Register("refine", regex)
endfunction

"
" "include": {
"     "search_regex": "include {id}",
" },
function! s:tokens.RegisterInclude()
    let regex = #{
        \search: ''
    \}

    call s:Ruby.Register("include", regex)
endfunction

"
" "extend": {
"     "search_regex": "extend {id}",
" },
function! s:tokens.RegisterExtend()
    let regex = #{
        \search: ''
    \}

    call s:Ruby.Register("extend", regex)
endfunction

"
" "using": {
"     "search_regex": "using {id}",
" }
function! s:tokens.RegisterUsing()
    let regex = #{
        \search: ''
    \}

    call s:Ruby.Register("using", regex)
endfunction
