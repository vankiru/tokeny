"
" "def {id}.*{arts}"
function! g:Ruby.tokens.RegisterMethod()
    let regex = #{
        \name: tags.method_name,
        \token: "\<def\>\s\+".id.base.arts
    \}

    let commands = #{}

    call g:Ruby.Register("method", regex, commands)
endfunction

"
" ".{id}"
" "&.{id}"
function! g:Ruby.tokens.RegisterCall()
    let regex = #{
        \name: tags.method_name,
        \token: "\&\=\.".name.base.arts.base.block
    \}

    call g:Ruby.Register("call", regex)
endfunction

"
" "return",
function! g:Ruby.tokens.RegisterReturn()
    let regex = #{
        \body: tags.expression,
        \token: "\<return\>\s*\%(".body."\)\=".base.modifier
    \}

    call g:Ruby.Register("return", regex)
endfunction

"
" "super",
function! g:Ruby.tokens.RegisterSuper()
    let regex = #{
        \body: tags.arts,
        \token: "\<super\>\s*".body
    \}

    call g:Ruby.Register("super", regex)
endfunction

"
" "yield",
" "yeild self",
function! g:Ruby.tokens.RegisterYield()
    let regex = #{
        \body: tags.expression,
        \token: "\<yield\>\s*".body
    \}

    call g:Ruby.Register("super", regex)
endfunction
