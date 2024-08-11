let s:Ruby = g:Ruby
let s:atoms = s:Ruby.atoms

function! s:atoms.RegisterNoname()
    let snake_name = '\<\h\w*\>'
    let class_name = '\%(::\)\=\<\u\w*\>\%(::\<\u\w*\>\)*'
    let const_name = '\<\u\(\u\|\d\|_\)*\>'
    let path = '\<\w\+\>'

    let s:atoms.noname = #{
        \snake_name: snake_name,
        \snake_text: '\h\w*.\{-}',
        \method_name: snake_name.'[!?]\=',
        \class_name: class_name,
        \const_name:  const_name,
        \name: '\%('.snake_name.'\|'.const_name.'\|'.class_name.'\)',
        \arts: '\%((.\{-})\|\s\+.*\)',
        \barbs: '|.\{-}|',
        \text: '.\{-}',
        \expresion: '',
        \path: '\/\='.path.'\%(\/\'.path.'\)*\%(\.'.path.'\)\='
    \}
endfunction

function! s:atoms.RegisterNamed()
    let snake_name = "\<".id."\w*\>"
    let class_name = "\%(::\)\=\<".id ."\w*\>\%(::\<\u\w*\>\)*"
    let const_name = "\<".id."\(\u\|\d\|_\)*\>"
    let path = '\<\w\+\>'

    let s:atoms.named: #{
        \snake_name: snake_name,
        \snake_text: id."\w*.\{-}",
        \method_name: snake_name."[!?]\=",
        \class_name: class_name,
        \const_name: const_name,
        \name: "\%(".snake_name."\|".const_name."\|".class_name."\)",
        \arts: "\%((".id.".\{-})"."\|"."\s\+".id.".*\)",
        \barbs: "|".id.".\{-}|",
        \text: id.".\{-}",
        \expresion: '',
        \path: "\/\=\<".id."\w\+\>\%(\/".path."\)*\%(\.".path."\)\="
    \}
endfunction
