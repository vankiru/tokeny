"
function! g:Ruby.tokens.RegisterExceptions()
    call g:Ruby.tokens.RegisterRaise()
    call g:Ruby.tokens.RegisterRescue()
    call g:Ruby.tokens.RegisterEnsure()
    call g:Ruby.tokens.RegisterRetry()
endfunction

" raise
" raise {id}.*,
" raise '{id}.*'
function! g:Ruby.tokens.RegisterRaise()
    let input = #{
        \base: #{type: 'space', text: 'raise {value}'},
        \empty: #{type: 'space', text: 'raise'}
    \}

    let search = #{
        \body: s:RaiseBodyRegex(),
        \token: '\<raise\>\s*{body}'
    \}

    let select = #{
        \body: 'line',
        \token: 'line'
    \}

    call g:Ruby.Register('raise', input, search, select)
endfunction

function! s:RaiseBodyRegex()
    let class = '{tags.class_name}\%(\.\<new\>{base.arts}\)\='
    let string = '"{tags.text}"'
    let exp = '{tags.exp}'

    return '\%('.class.'\|'.string.'\|'.exp.'\)'
endfunction

"
" rescue
" rescue {id}.*
" rescue \(.* \)\?=> {id}.*
function! g:Ruby.tokens.RegisterRescue()
    let input = #{
        \class: #{type: 'below', text: 'rescue {value}'},
        \variable: #{type: 'below', text: 'rescue as {value}'},
        \class_variable: #{type: 'below', text: 'rescue {values[0]} as {values[1]}'},
        \empty: #{type: 'below', text: 'rescue'}
    \}

    let search = #{
        \body: s:RescueBodyRegex(),
        \token: '\<rescue\>\s*{body}'
    \}

    let select = #{
        \body: 'i.body',
        \token: 'a.body'
    \}

    call g:Ruby.Register('rescue', input, search, select)
endfunction

function! s:RescueBodyRegex()
    let class = '{tags.class_name}\%(,\s*{base.class_name}\)*'
    let variable = '=>\s*{tags.snake_name}'
    let combine_class = class.'\s*=>\s*{base.snake_name}'
    let combine_variable = '{base.class_name}\%(,\s*{base.class_name}\)*\s*'.variable
    let blank = '{tags.exp}'

    return '\%('.class.'\|'.variable.'\|'.combine_class.'\|'.combine_variable.'\|'.blank.'\)'
endfunction

"
" ensure
function! g:Ruby.tokens.RegisterEnsure()
    let input = #{
        \base: #{type: 'below', text: 'ensure'}
    \}

    let search = #{
        \body: '{base.exp}',
        \token: '\<ensure\>\n{body}'
    \}

    let select = #{
        \body: 'line',
        \token: 'line'
    \}

    call g:Ruby.Register('ensure', input, search, select)
endfunction

"
" retry
function! g:Ruby.tokens.RegisterRetry()
    let input = #{
        \base: #{type: 'below', text: 'retry'}
    \}

    let search = #{token: '\<retry\>'}
    let select = #{
        \body: 'line',
        \token: 'line'
    \}

    call g:Ruby.Register('retry', input, search, select)
endfunction
