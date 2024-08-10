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
function! s:Language.RegisterAtom(name, params)
    let self.atoms[a:name] = g:Atom.New(self, a:name, a:params)
endfunction

"
function! s:Language.RegisterToken(name, params)
    let self.tokens[a:name] = g:Token.New(self, a:name, a:params)
endfunction
