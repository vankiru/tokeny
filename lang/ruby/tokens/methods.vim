"
" "def {id}.*{arts}"
function! s:tokens.RegisterMethod()
    let regex = #{
        \name: named.method_name,
        \search: "\<def\>\s\+".id.noname.arts
    \}

    let commands = #{}

    call s:Ruby.Register("method", regex, commands)
endfunction

"
" ".{id}"
" "&.{id}"
function! s:tokens.RegisterCall()
    let regex = #{
        \name: named.method_name,
        \search: "\&\=\.".name.noname.arts.noname.block
    \}

    call s:Ruby.Register("call", regex)
endfunction

"
" "return",
function! s:tokens.RegisterReturn()
    let regex = #{
        \body: named.expression,
        \search: "\<return\>\s*\%(".body."\)\=".noname.modifier
    \}

    call s:Ruby.Register("return", regex)
endfunction

"
" "super",
function! s:tokens.RegisterSuper()
    let regex = #{
        \body: named.arts,
        \search: "\<super\>\s*".body
    \}

    call s:Ruby.Register("super", regex)
endfunction

"
" "yield",
" "yeild self",
function! s:tokens.RegisterYield()
    let regex = #{
        \body: named.expression,
        \search: "\<yield\>\s*".body
    \}

    call s:Ruby.Register("super", regex)
endfunction
