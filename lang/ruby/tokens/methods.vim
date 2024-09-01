"
function! g:Ruby.tokens.RegisterMethods()
    call g:Ruby.tokens.RegisterMethod()
    call g:Ruby.tokens.RegisterCall()
    call g:Ruby.tokens.RegisterReturn()
    call g:Ruby.tokens.RegisterSuper()
    call g:Ruby.tokens.RegisterYield()
endfunction

"
" def {mthod_name}.*{arts} = {body}
" def {mthod_name}.*{arts}
" {body}
function! g:Ruby.tokens.RegisterMethod()
    let multi = '\<def\>\s\+{name}{base.arts}\n{body}'
    let line = '\<def\>\s\+{name}{base.arts}\s\+=\s\+{body}'

    let regex = #{
        \name: '{tags.method_name}',
        \body: '{base.exp}',
        \token: '\%('.multi.'\|'.line.'\)'
    \}

    let select = #{}

    call g:Ruby.Register('method', regex, select)
endfunction

"
" .{mthod_name}
" &.{mthod_name}
function! g:Ruby.tokens.RegisterCall()
    let regex = #{
        \name: '{tags.method_name}',
        \token: '\&\=\.{name}{base.arts}'
    \}

    let select = #{
    \}

    call g:Ruby.Register('call', regex, select)
endfunction

"
" return
" return {exp}
function! g:Ruby.tokens.RegisterReturn()
    let regex = #{
        \body: '{tags.exp}',
        \token: '\<return\>\s*{body}'
    \}

    let select = #{
    \}

    call g:Ruby.Register('return', regex, select)
endfunction

"
" super
" super {arts}
function! g:Ruby.tokens.RegisterSuper()
    let regex = #{
        \body: '{tags.exp}',
        \token: '\<super\>\s*{body}'
    \}

    let select = #{
    \}

    call g:Ruby.Register('super', regex, select)
endfunction

"
" yield
" yeild self
function! g:Ruby.tokens.RegisterYield()
    let regex = #{
        \body: '{tags.exp}',
        \token: '\<yield\>\s*{body}'
    \}

    let select = #{
    \}

    call g:Ruby.Register('yield', regex, select)
endfunction
