"
function! s:tokens.RegisterIf()
    let line = body."\%(.\{-}\)\@<=\s*\<if\>\s*".test
    let block = "\%(^\s*\)\@<=\<if\>\s*".test.body

    let regex = #{
        \test: id.expression,
        \body: base.expression,
        \token: '\%('.line.'\|'.block'\)'
    \}

    let select = #{
        \test: "line",
        \body: ["", "i.block"],
        \token: ["", "a.block"]
    \}

    call s:Ruby.Register("if", regex, select)
endfunction

"
function! s:tokens.RegisterElse()
    let regex = #{
        \body: "\s*".id.body,
        \token: "\<else\>".body
    \}

    let select = #{
        \body: "i.block",
        \token: "a.block"
    \}

    call s:Ruby.Register("if", regex, select)
endfunction

"
function! s:tokens.RegisterElsif()
    let regex = #{
        \test: id.expression,
        \body: base.body,
        \token: "\<elsif\>\s*".test.body
    \}

    let select = #{
        \test: "line",
        \body: "i.block",
        \token: "a.block"
    \}

    call s:Ruby.Register("elsif", regex, select)
endfunction

"
function! s:tokens.RegisterUnless()
    let line = body."\%(.\{-}\)\@<=\s*\<unless\>\s*".test
    let block = "\%(^\s*\)\@<=\<unless\>\s*".text

    let regex = #{
        \test: id.expression,
        \body: base.expression,
        \token: '\%(' . line . '\|' . block '\)'
    \}

    let select = #{
        \change: s:select.ChangeBlockOr(),
        \chunk: s:select.ChangeBlockOr()
    \}

    call s:Ruby.Register("unless", regex, select)
endfunction

"
function! s:tokens.RegisterWhile()
    let line = '''\%(.\{-}\)\@<=\s*\<while\>\s*'' . test'
    let block = '''\%(^\s*\)\@<=\<while\>\s*'' . text'

    let regex = #{
        \test: id.expression,
        \body: base.expression,
        \token: '\%(' . line . '\|' . block '\)'
    \}

    let select = #{
        \change: s:select.ChangeBlockOr(),
        \chunk: s:select.ChangeBlockOr()
    \}

    call s:Ruby.Register("until", regex, select)
endfunction

"
function! s:tokens.RegisterUntil()
    let line = '''\%(.\{-}\)\@<=\s*\<while\>\s*'' . test'
    let block = '''\%(^\s*\)\@<=\<while\>\s*'' . text'

    let regex = #{
        \test: id.expression,
        \body: base.expression,
        \token: '\%(' . line . '\|' . block '\)'
    \}

    let select = #{
        \change: s:select.ChangeBlockOr(),
        \chunk: s:select.ChangeBlockOr()
    \}

    call s:Ruby.Register("until", regex, select)
endfunction

"
function! s:tokens.RegisterTriple()
    let regex = #{
        \test: id.expression,
        \body: base.expression,
        \token: test . '? .\{-} : .\{-}'
    \}

    let select = #{
        \change: s:select.ChangeBlockOr(),
        \chunk: s:select.ChangeBlockOr()
    \}

    call s:Ruby.Register("triple", regex, select)
endfunction

"
function! s:tokens.RegisterCase()
    let regex = #{
        \test: id.expression,
        \token: '\<case\>\s*' . test
    \}

    let select = #{
        \change: s:select.ChangeBlock(),
        \chunk: s:select.ChangeBlock()
    \}

    call s:Ruby.Register("case", regex, select)
endfunction

"
function! s:tokens.RegisterWhen()
    let regex = #{
        \test: id.expression,
        \token: '\<when\>\s\+' . test . '\%(\s*\<then\>\s*.*\)\@='
    \}

    let select = #{
        \change: s:select.ChangeBlockOr(),
        \chunk: s:select.ChangeBlockOr()
    \}

    call s:Ruby.Register("when", regex, select)
endfunction

"
function! s:tokens.RegisterThen()
    let regex = #{
        \body: id.expression,
        \token: '\<then\>\s*' . body
    \}

    call s:Ruby.Register("then", regex, select)
endfunction

"
function! s:tokens.RegisterEndWhile()
    let regex = #{
        \test: id.expression,
        \token: '\<end\>\s\+\<while\>\s\+' . test
    \}

    let select = #{
        \change: s:select.ChangeBlock(),
        \chunk: s:select.ChangeBlock()
    \}

    call s:Ruby.Register("end_while", regex, select)
endfunction

"
function! s:tokens.RegisterBreak()
    let regex = #{
        \test: id.expression,
        \body: id.expression,
        \token: '\<break\>\s*' . body . '\%(\s*\<\%(if\|unless\)\>\s*' . test . '\)\@='
    \}

    call s:Ruby.Register("break", regex)
endfunction

"
function! s:tokens.RegisterNext()
    let regex = #{
        \test: id.expression,
        \body: id.expression,
        \token: '\<next\>\s*' . body . '\%(\s*\<\%(if\|unless\)\>\s*' . test . '\)\@='
    \}

    call s:Ruby.Register("next", regex)
endfunction
