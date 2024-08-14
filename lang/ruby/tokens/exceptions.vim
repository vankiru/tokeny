" "raise {id}.*",
" 'raise "{id}.*"'
function! s:tokens.RegisterRaise()
    let class = named.class_name."\%(\.\<new\>\%(".noname.arts."\)\=\)\="
    let string = "[\"'']".named.text."[\"'']"

    let regex = #{
        \body: "\%(".class."\|".string."\)="
        \search: "\<raise\>\s*".body
    \}

    call s:Ruby.Register("raise", regex)
endfunction

"
" "rescue$"
" "rescue {id}.*",
function! s:tokens.RegisterRescue()
    let class = named.class_name."\%(,\s*".noname.class_name."\)*"

    let regex = #{
        \body: 
        \search: "\<rescue\>\s*"
    \}

    call s:Ruby.Register("rescue", regex)
endfunction

"
" "rescue as": {
"   "search_regex": "rescue \(.* \)\?=> {id}.*"
" }
function! s:tokens.RegisterRescueAs()
    let regex = #{
        \search: ''
    \}

    call s:Ruby.Register("rescue_as", regex)
endfunction

"
" "begin": {
"   "search_regex": "begin$"
" },
function! s:tokens.RegisterBegin()
    let regex = #{
        \search: ''
    \}

    call s:Ruby.Register("begin", regex)
endfunction

"
" "ensure": {
"   "search_regex": "ensure$"
" },
function! s:tokens.RegisterEnsure()
    let regex = #{
        \search: ''
    \}

    call s:Ruby.Register("ensure", regex)
endfunction

"
" "retry": {
"   "search_regex": "retry$"
" }
function! s:tokens.RegisterRetry()
    let regex = #{
        \search: ''
    \}

    call s:Ruby.Register("retry", regex)
endfunction
