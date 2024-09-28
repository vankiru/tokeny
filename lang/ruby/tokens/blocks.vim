function! g:Ruby.tokens.RegisterBlock()
    let input = #{
        \inline: #{type: 'space', text: '{ }', move: 1},
        \block: #{type: 'space', text: 'do\nend'}
    \}

    let multi = '\%(\<\%(while\|until\|for\)\>\s\+.\{-}\)\@<!\s\+\<do\>\s*{base.barbs}\n{body}'
    let inline = '\%(->\|)\|{base.method_name}\)\@<=\s*{\s*{base.barbs}{body}'

    let search = #{
        \body: '\s*[^}]',
        \token: '\%('.multi.'\|'.inline.'\)'
    \}

    let select = #{body: 'i.block', token: 'a.block'}

    call g:Ruby.Register('block', input, search, select)
endfunction
