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
  call g:Ruby.RegisterBreak()
  call g:Ruby.RegisterNext()
endfunction

"
function! g:Ruby.tokens.RegisterModifierControl(name)
    let line = '\%({base.exp}\)\@<=\s*\<'.a:name.'\>\s*{test}'
    let block = '\%(^\s*\)\@<=\<'.a:name.'\>\s*{test}\n{body}'

    let regex = #{
        \test: '{tags.exp}',
        \body: '{base.exp}',
        \token: '\%('.line.'\|'.block.'\)'
    \}

    let select = #{
        \test: 'line',
        \body: ['', 'i.block'],
        \token: ['', 'a.block']
    \}

    call g:Ruby.Register(a:name, regex, select)
endfunction

"
function! g:Ruby.RegisterElse()
    let regex = #{
        \body: '{tags.exp}',
        \token: '\<else\>\n{body}'
    \}

    let select = #{
        \body: 'i.block',
        \token: 'a.block'
    \}

    call g:Ruby.Register('else', regex, select)
endfunction

"
function! g:Ruby.RegisterElsif()
    let regex = #{
        \test: '{tags.exp}',
        \body: '{base.exp}',
        \token: '\<elsif\>\s*{test}\n{body}'
    \}

    let select = #{
        \test: 'line',
        \body: 'i.block',
        \token: 'a.block'
    \}

    call g:Ruby.Register('elsif', regex, select)
endfunction

"
function! g:Ruby.RegisterTriple()
    let regex = #{
        \test: '{tags.exp}',
        \token: '{test}\s\+?\s*{base.exp}\s*:\s*{base.exp}'
    \}

    let select = #{
        \test: '',
        \token: ''
    \}

    call g:Ruby.Register('triple', regex, select)
endfunction

"
function! g:Ruby.RegisterCase()
    let regex = #{
        \test: '{tags.exp}',
        \body: '{base.exp}',
        \token: '\<case\>\s\+{test}\n{body}'
    \}

    let select = #{
        \test: 'line',
        \body: 'i.block',
        \token: 'a.block'
    \}

    call g:Ruby.Register('case', regex, select)
endfunction

"
function! g:Ruby.RegisterWhen()
    let line = '\%({base.exp}\)\='
    let multi = '\n{base.exp}'
    let body = '\%(\s*\<then\>)\=\%('.line.'\|'.multi.'\)'

    let regex = #{
        \test: '{tags.exp}',
        \body: '\%('.line.'\|'.multi.'\)',
        \token: '\<when\>\s\+{test}{body}'
    \}

    let select = #{
        \test: 'line',
        \body: ['', ''],
        \token: ['', '']
    \}

    call g:Ruby.Register('when', regex, select)
endfunction

"
function! g:Ruby.RegisterThen()
    let regex = #{
        \body: '{tags.exp}',
        \token: '\<then\>\s\+{body}'
    \}

    let select = #{
        \body: '',
        \token: ''
    \}

    call g:Ruby.Register('then', regex, select)
endfunction

"
function! g:Ruby.RegisterBegin()
    let regex = #{
        \body: '{base.exp}',
        \token: 'begin\n{body}'
    \}

    let select = #{
        \test: 'line',
        \body: 'i.block',
        \token: 'a.block'
    \}

    call g:Ruby.Register('begin', regex, select)
endfunction

"
function! g:Ruby.RegisterBreak()
    let regex = #{
        \body: '{tags.exp}',
        \token: '\<break\>\s*{body}{base.modifier}'
    \}

    let select = #{}

    call g:Ruby.Register('break', regex, select)
endfunction

"
function! g:Ruby.RegisterNext()
    let regex = #{
        \body: '{tags.exp}',
        \token: '\<next\>\s*{body}{base.modifier}'
    \}

    let select = #{}

    call g:Ruby.Register('next', regex, select)
endfunction
