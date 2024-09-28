"
function! g:Ruby.tokens.RegisterControls()
  call g:Ruby.tokens.RegisterModifierControl('if')
  call g:Ruby.tokens.RegisterModifierControl('unless')
  call g:Ruby.tokens.RegisterModifierControl('while')
  call g:Ruby.tokens.RegisterModifierControl('until')

  call g:Ruby.RegisterElse()
  call g:Ruby.RegisterElsif()
  call g:Ruby.RegisterTriple()
  call g:Ruby.RegisterCase()
  call g:Ruby.RegisterWhen()
  call g:Ruby.RegisterThen()
  call g:Ruby.RegisterBegin()
  call g:Ruby.RegisterEnd()

  call g:Ruby.RegisterBlockControl('break')
  call g:Ruby.RegisterBlockControl('next')
endfunction

"
function! g:Ruby.tokens.RegisterModifierControl(type)
    let input = #{
        \inline: #{type: 'space', text: a:type},
        \multi: #{type: 'space', text: a:type.'\nend'}
    \}

    let line = '\%({base.exp}\)\@<=\s*\<'.a:type.'\>\s*{test}'
    let block = '\%(^\s*\)\@<=\<'.a:type.'\>\s*{test}\n{body}'

    let search = #{
        \test: '{tags.exp}',
        \body: '{base.exp}',
        \token: '\%('.line.'\|'.block.'\)'
    \}

    let select = #{
        \test: 'line',
        \body: 'i.modifier',
        \token: 'a.modifier'
    \}

    call g:Ruby.Register(a:type, input, search, select)
endfunction

"
function! g:Ruby.RegisterElse()
    let input = #{
        \base: #{type: 'below', text: 'else'}
    \}

    let search = #{
        \body: '{base.exp}',
        \token: '\<else\>\n{body}'
    \}

    let select = #{
        \body: 'i.body',
        \token: 'a.body'
    \}

    call g:Ruby.Register('else', input, search, select)
endfunction

"
function! g:Ruby.RegisterElsif()
    let input = #{
        \base: #{type: 'below', text: 'elsif'}
    \}

    let search = #{
        \test: '{tags.exp}',
        \body: '{base.exp}',
        \token: '\<elsif\>\s*{test}\n{body}'
    \}

    let select = #{
        \test: 'line',
        \body: 'i.body',
        \token: 'a.body'
    \}

    call g:Ruby.Register('elsif', input, search, select)
endfunction

"
function! g:Ruby.RegisterTriple()
    let input = #{
        \base: #{type: 'space', text: ' ? :', move: 4}
    \}

    let search = #{
        \test: '{tags.exp}',
        \token: '{test}\s\+?\s*{base.exp}\s*:\s*{base.exp}'
    \}

    let select = #{
        \test: '',
        \token: ''
    \}

    call g:Ruby.Register('triple', input, search, select)
endfunction

"
function! g:Ruby.RegisterCase()
    let input = #{
        \base: #{type: 'space', text: 'case\nend'}
    \}

    let search = #{
        \test: '{tags.exp}',
        \body: '{base.exp}',
        \token: '\<case\>\s\+{test}\n{body}'
    \}

    let select = #{
        \test: 'line',
        \body: 'i.body',
        \token: 'a.body'
    \}

    call g:Ruby.Register('case', input, search, select)
endfunction

"
function! g:Ruby.RegisterWhen()
    let input = #{
        \base: #{type: 'below', text: 'when'}
    \}

    let line = '\%({base.exp}\)\='
    let multi = '\n{base.exp}'
    let body = '\%(\s*\<then\>)\=\%('.line.'\|'.multi.'\)'

    let search = #{
        \test: '{tags.exp}',
        \body: '\%('.line.'\|'.multi.'\)',
        \token: '\<when\>\s\+{test}{body}'
    \}

    let select = #{
        \test: 'line',
        \body: 'i.modifier',
        \token: 'a.modifier'
    \}

    call g:Ruby.Register('when', input, search, select)
endfunction

"
function! g:Ruby.RegisterThen()
    let input = #{
        \base: #{type: 'space', text: 'then'}
    \}

    let search = #{
        \body: '{tags.exp}',
        \token: '\<then\>\s\+{body}'
    \}

    let select = #{
        \body: 'i.modifier',
        \token: 'a.modifier'
    \}

    call g:Ruby.Register('then', input, search, select)
endfunction

"
function! g:Ruby.RegisterBegin()
    let input = #{
        \base: #{type: 'below', text: 'begin\nend'}
    \}

    let search = #{
        \body: '{base.exp}',
        \token: '\<begin\>\n{body}'
    \}

    let select = #{
        \test: 'line',
        \body: 'i.body',
        \token: 'a.body'
    \}

    call g:Ruby.Register('begin', input, search, select)
endfunction

"
function! g:Ruby.RegisterEnd()
    let input = #{
        \base: #{type: 'below', text: 'end'}
    \}
    let search = #{token: '\<end\>'}
    let select = #{token: 'snake_name'}

    call g:Ruby.Register('end', input, search, select)
endfunction

"
function! g:Ruby.RegisterBlockControl(type)
    let input = #{
        \base: #{type: 'space', text: a:type}
    \}

    let search = #{
        \body: '{tags.exp}',
        \token: '\<'.a:type.'\>\s*{body}{base.modifier}'
    \}

    let select = #{
        \body: 'line',
        \token: 'line'
    }

    call g:Ruby.Register(a:type, input, search, select)
endfunction
