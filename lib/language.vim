" ClASS: Language
" atoms
" tokens
"============================================================

let s:Language = #{atoms: {}, tokens: {}, commands: {}}
let g:Language = s:Language

function! s:Language.New()
    let language = copy(self)
    return language
endfunction

"
function! s:Language.Register(name, regex, commands = {})
    let self.tokens[a:name] = g:Token.New(self, a:name, a:params, a:commands)
endfunction
