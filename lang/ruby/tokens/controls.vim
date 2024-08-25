"
function! s:tokens.RegisterIf()
    let line = '''\%(.\{-}\)\@<=\s*\<if\>\s*'' . test'
    let block = '''\%(^\s*\)\@<=\<if\>\s*'' . text'

    let regex = #{
        \test: id.expression,
        \body: base.expression,
        \search: '\%(' . line . '\|' . block '\)'
    \}

    let commands = #{
        \change: s:commands.ChangeBlockOr(),
        \chunk: s:commands.ChangeBlockOr()
    \}

    call s:Ruby.Register("if", regex, commands)
endfunction

"
function! s:tokens.RegisterElse()
    let regex = #{
        \body: '\s*' . id.expression,
        \search: '\<else\>' . body
    \}

    let commands = #{
        \change: s:commands.ChangeBlockOr(),
        \chunk: s:commands.ChangeBlockOr()
    \}

    call s:Ruby.Register("if", regex, commands)
endfunction

"
function! s:tokens.RegisterElsif()
    let regex = #{
        \test: id.expression,
        \search: '\<elsif\>\s*' . test
    \}

    let commands = #{
        \change: s:commands.ChangeBlockOr(),
        \chunk: s:commands.ChangeBlockOr()
    \}

    call s:Ruby.Register("elsif", regex, commands)
endfunction

"
function! s:tokens.RegisterUnless()
    let line = '''\%(.\{-}\)\@<=\s*\<unless\>\s*'' . test'
    let block = '''\%(^\s*\)\@<=\<unless\>\s*'' . text'

    let regex = #{
        \test: id.expression,
        \body: base.expression,
        \search: '\%(' . line . '\|' . block '\)'
    \}

    let commands = #{
        \change: s:commands.ChangeBlockOr(),
        \chunk: s:commands.ChangeBlockOr()
    \}

    call s:Ruby.Register("unless", regex, commands)
endfunction

"
function! s:tokens.RegisterWhile()
    let line = '''\%(.\{-}\)\@<=\s*\<while\>\s*'' . test'
    let block = '''\%(^\s*\)\@<=\<while\>\s*'' . text'

    let regex = #{
        \test: id.expression,
        \body: base.expression,
        \search: '\%(' . line . '\|' . block '\)'
    \}

    let commands = #{
        \change: s:commands.ChangeBlockOr(),
        \chunk: s:commands.ChangeBlockOr()
    \}

    call s:Ruby.Register("until", regex, commands)
endfunction

"
function! s:tokens.RegisterUntil()
    let line = '''\%(.\{-}\)\@<=\s*\<while\>\s*'' . test'
    let block = '''\%(^\s*\)\@<=\<while\>\s*'' . text'

    let regex = #{
        \test: id.expression,
        \body: base.expression,
        \search: '\%(' . line . '\|' . block '\)'
    \}

    let commands = #{
        \change: s:commands.ChangeBlockOr(),
        \chunk: s:commands.ChangeBlockOr()
    \}

    call s:Ruby.Register("until", regex, commands)
endfunction

"
function! s:tokens.RegisterTriple()
    let regex = #{
        \test: id.expression,
        \body: base.expression,
        \search: test . '? .\{-} : .\{-}'
    \}

    let commands = #{
        \change: s:commands.ChangeBlockOr(),
        \chunk: s:commands.ChangeBlockOr()
    \}

    call s:Ruby.Register("triple", regex, commands)
endfunction

"
function! s:tokens.RegisterCase()
    let regex = #{
        \test: id.expression,
        \search: '\<case\>\s*' . test
    \}

    let commands = #{
        \change: s:commands.ChangeBlock(),
        \chunk: s:commands.ChangeBlock()
    \}

    call s:Ruby.Register("case", regex, commands)
endfunction

"
function! s:tokens.RegisterWhen()
    let regex = #{
        \test: id.expression,
        \search: '\<when\>\s\+' . test . '\%(\s*\<then\>\s*.*\)\@='
    \}

    let commands = #{
        \change: s:commands.ChangeBlockOr(),
        \chunk: s:commands.ChangeBlockOr()
    \}

    call s:Ruby.Register("when", regex, commands)
endfunction

"
function! s:tokens.RegisterThen()
    let regex = #{
        \body: id.expression,
        \search: '\<then\>\s*' . body
    \}

    call s:Ruby.Register("then", regex, commands)
endfunction

"
function! s:tokens.RegisterEndWhile()
    let regex = #{
        \test: id.expression,
        \search: '\<end\>\s\+\<while\>\s\+' . test
    \}

    let commands = #{
        \change: s:commands.ChangeBlock(),
        \chunk: s:commands.ChangeBlock()
    \}

    call s:Ruby.Register("end_while", regex, commands)
endfunction

"
function! s:tokens.RegisterBreak()
    let regex = #{
        \test: id.expression,
        \body: id.expression,
        \search: '\<break\>\s*' . body . '\%(\s*\<\%(if\|unless\)\>\s*' . test . '\)\@='
    \}

    call s:Ruby.Register("break", regex)
endfunction

"
function! s:tokens.RegisterNext()
    let regex = #{
        \test: id.expression,
        \body: id.expression,
        \search: '\<next\>\s*' . body . '\%(\s*\<\%(if\|unless\)\>\s*' . test . '\)\@='
    \}

    call s:Ruby.Register("next", regex)
endfunction
