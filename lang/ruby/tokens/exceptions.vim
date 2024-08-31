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
    let class = '{tags.class_name}\%(\.\<new\>{base.arts}\)\='
    let string = '"{tags.text}"'
    let exp = '{tags.exp}'
    let blank = '\s*$\|{base.modifier}'

    let regex = #{
        \body: '\%('.class.'\|'.string.'\|'.exp.'\|'.blank.'\)',
        \token: '\<raise\>\s\+{body}'
    \}

    let select = #{
    \}

    call g:Ruby.Register('raise', regex, select)
endfunction

"
" rescue
" rescue {id}.*
" rescue \(.* \)\?=> {id}.*
function! g:Ruby.tokens.RegisterRescue()
    let class = '{tags.class_name}\%(,\s*{base.class_name}\)*'
    let variable = '=>\s*{tags.snake_name}'
    let combine_class = class.'\s*=>\s*{base.snake_name}'
    let combine_variable = '{base.class_name}\%(,\s*{base.class_name}\)*\s*'.variable

    let regex = #{
        \body: '\%('.class.'\|'.variable.'\|'.combine_class.'\|'.combine_variable.'\|\s*$\)',
        \token: '\<rescue\>\s\+{body}'
    \}

    let select = #{
    \}

    call g:Ruby.Register('rescue', regex, select)
endfunction

"
" ensure
function! g:Ruby.tokens.RegisterEnsure()
    let regex = #{
        \body: '{base.exp}',
        \token: '\<ensure\>\n{body}'
    \}

    let select = #{
    \}

    call g:Ruby.Register('ensure', regex, select)
endfunction

"
" retry
function! g:Ruby.tokens.RegisterRetry()
    let regex = #{token: '\<retry\>'}
    let select = #{}

    call g:Ruby.Register('retry', regex, select)
endfunction
