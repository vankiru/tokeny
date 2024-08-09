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
function! s:Language.RegisterAtom(name, context, regex)
    let atoms[name] = g:Atom.new(name, context, regex)
endfunction

"
function! s:Language.RegisterToken(name, context, regex)
    let tokens[name] = g:Token.new(name, context, regex)
endfunction
