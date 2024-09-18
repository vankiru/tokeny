" ClASS: Language
" atoms
" tokens
"============================================================

let s:Language = #{atoms: {}, tokens: {}}
let g:Language = s:Language

function! s:Language.New()
    let language = copy(self)
    return language
endfunction

"
function! s:Language.Register(name, input, search, select)
    let self.tokens[a:name] = g:Token.New(self, a:input, a:search, a:select)
endfunction

"
function! s:Language.GetToken(name)
    let token = get(self.tokens, a:name, {})

    if token == {}
        echoerr 'Token not found'
    endif

    return token
endfunction
