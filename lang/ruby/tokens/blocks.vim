let s:Ruby = g:Ruby

function! s:Ruby.tokens.RegisterBlock()
    let multi = '\%(\<\%(while\|until\|for\)\>\s\+.\{-}\)\@<!\s\+\<do\>\s*{base.barbs}\n{body}'
    let inline = '\%(->\|)\|{base.method_name}\)\@<=\s*{\s*{base.barbs}{body}'

    let regex = #{
        \body: '\s*[^}]',
        \token: '\%('.multi.'\|'.inline.'\)'
    \}

    let select = #{
        \body: ['vir', 'vi{'],
        \token: ['var', 'va{oh']
    \}

    call s:Ruby.Register('block', regex, select)
endfunction
