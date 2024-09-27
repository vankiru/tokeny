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
    let input = #{
        \base: #{type: 'below', text: 'def {value}\nend'},
        \short: #{type: 'below', text: 'def {value} ='}
    \}

    let multi = '\<def\>\s\+{name}{base.arts}\n{body}'
    let line = '\<def\>\s\+{name}{base.arts}\s\+=\s\+{body}'

    let search = #{
        \name: '{tags.method_name}',
        \body: '{base.exp}',
        \token: '\%('.multi.'\|'.line.'\)'
    \}

    let select = #{}

    call g:Ruby.Register('method', input, search, select)
endfunction

"
" .{mthod_name}
" &.{mthod_name}
function! g:Ruby.tokens.RegisterCall()
    let input = #{
        \base: #{type: 'after', text: '.{value}'},
        \safe: #{type: 'after', text: '&.{value}'},
        \bang: #{type: 'after', text: '&.{value}!'},
        \plight: #{type: 'after', text: '&.{value}?'}
    \}

    let search = #{
        \name: '{tags.method_name}',
        \token: '\&\=\.{name}{base.arts}'
    \}

    let select = #{
    \}

    call g:Ruby.Register('call', input, search, select)
endfunction

"
" return
" return {exp}
function! g:Ruby.tokens.RegisterReturn()
    let input = #{
        \base: #{type: 'space', text: 'return {value}'},
        \empty: #{type: 'space', text: 'return'}
    \}

    let search = #{
        \body: '{tags.exp}',
        \token: '\<return\>\s*{body}'
    \}

    let select = #{
    \}

    call g:Ruby.Register('return', input, search, select)
endfunction

"
" super
" super {arts}
function! g:Ruby.tokens.RegisterSuper()
    let input = #{
        \base: #{type: 'space', text: 'super {value}'},
        \empty: #{type: 'space', text: 'super'}
    \}

    let search = #{
        \body: '{tags.exp}',
        \token: '\<super\>\s*{body}'
    \}

    let select = #{
    \}

    call g:Ruby.Register('super', input, search, select)
endfunction

"
" yield
" yeild self
function! g:Ruby.tokens.RegisterYield()
    let input = #{
        \base: #{type: 'space', text: 'yield {value}'},
        \empty: #{type: 'space', text: 'yield'}
    \}

    let search = #{
        \body: '{tags.exp}',
        \token: '\<yield\>\s*{body}'
    \}

    let select = #{
    \}

    call g:Ruby.Register('yield', input, search, select)
endfunction
