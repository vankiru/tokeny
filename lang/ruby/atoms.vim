let s:atoms = g:Ruby.atoms

function! s:atoms.RegisterBase()
    let snake_name = '\<\h\w*\>'
    let class_name = '\%(::\)\=\<\u\w*\>\%(::\<\u\w*\>\)*'
    let const_name = '\<\u\(\u\|\d\|_\)*\>'
    let path = '\<\w\+\>'

    let s:atoms.base = #{
        \snake_name: snake_name,
        \snake_text: '\h\w*.\{-}',
        \method_name: snake_name.'[!?]\=',
        \class_name: class_name,
        \const_name:  const_name,
        \name: '\%('.snake_name.'\|'.const_name.'\|'.class_name.'\)',
        \arts: '\%((.\{-})\|\s\+.*\)\=',
        \barbs: '|.\{-}|',
        \text: '.\{-}',
        \string: '',
        \expresion: '',
        \path: '\/\='.path.'\%(\/\'.path.'\)*\%(\.'.path.'\)\=',
        \modifier: '\%(\s\+\<\%(if\|unless\|while\|until\)\>.*\)\=',
        \body: ''
    \}
endfunction

function! s:atoms.RegisterTags()
    let snake_name = '\<{id}\w*\>'
    let class_name = '\%(::\)\=\<{id}\w*\>\%(::\<\u\w*\>\)*'
    let const_name = '\<{id}\(\u\|\d\|_\)*\>'
    let path = '\<\w\+\>'

    let s:atoms.tags = #{
        \snake_name: snake_name,
        \snake_text: '{id}\w*.\{-}',
        \method_name: snake_name.'[!?]\=',
        \class_name: class_name,
        \const_name: const_name,
        \name: '\%('.snake_name.'\|'.const_name.'\|'.class_name.'\)',
        \arts: '\%(({id}.\{-})\|\s\+{id}.*\)',
        \barbs: '|{id}.\{-}|',
        \text: '{id}.\{-}',
        \string: '',
        \expresion: '',
        \path: '\/\=\<{id}\w\+\>\%(\/'.path.'\)*\%(\.'.path.'\)\=',
        \modifier: '\%(\s\+\<\%(if\|unless\|while\|until\)\>{id}.*\)\=',
        \body: ''
    \}
endfunction
