" CLASS: Select
"

let s:Select = {}
let g:Select = s:Select

function! s:Select.New(select)
    let select = copy(self)
    let select.select = a:select

    return select
endfunction

function! s:Select(key)
endfunction

let g:Language.select = #{
    \char: 'v',
    \name: 've',
    \snake_name: 've',
    \method_name: 've',
    \class_name: 'vic',
    \const_name: 've',
    \line: 'v$h',
    \number: '',
    \call: '',
    \operator: '',
    \i: #{
        \argument: 'via',
        \arts: 'vi(',
        \barbs: 'lvf|h',
        \block: 'vir',
        \body: 'vir',
        \modifier: 'vir',
        \string: 'vi"',
        \regex: '',
        \array: 'vi{',
    \},
    \a: #{
        \argument: 'via',
        \arts: 'va(',
        \barbs: 'vf|',
        \block: 'vir',
        \body: 'vir',
        \modifier: 'vir',
        \string: 'va"',
        \regex: '',
        \array: 'va[',
        \hash: 'va{',
    \}
\}
" block
"\body: ['vir', 'vi{'],
"\token: ['var', 'va{oh']

