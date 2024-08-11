let s:Ruby = g:Ruby
let s:atoms = s:Ruby.atoms

function! s:Ruby.RegisterAtoms
    let s:atoms = #{
        \a = #{
            \snake_name: '\<\h\w*\>',
            \snake_text: '\h\w*.\{-}',
            \method_name: '\<\h\w*\>[!?]\=',
            \class_name: '\%(::\)\=\<\u\w*\>\%(::\<\u\w*\>\)*',
            \const_name:  '\<\u\(\u\|\d\|_\)*\>',
            \arts: '(.\{-})',
            \barbs: '|.\{-}|',
            \block: '',
            \text: '.\{-}'
        \},
        \named: #{
            \snake_name: '''\<'' . id . ''\w*\>''',
            \snake_text: 'id . ''\w*.\{-}''',
            \method_name: '''\<'' . id . ''\w*\>[!?]\=''',
            \class_name: '''\%(::\)\=\<'' . id . ''\w*\>\%(::\<\u\w*\>\)*''',
            \const_name: '''\<'' . id . ''\(\u\|\d\|_\)*\>''',
            \arts: '''('' . id . ''.\{-})''',
            \barbs: '''|'' . id . ''.\{-}|''',
            \block: '',
            \text: 'id . ''.\{-}'''
        \}
    \}
endfunction
