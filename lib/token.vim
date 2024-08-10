" ClASS: Token
" language
" name
" context = {
"   name
"   body
"   test
"   search
"   type
" }
" NameRegex
" BodyRegex
" TestRegex
" SearchRegex
"============================================================

let s:Token = {}
let g:Token = s:Token

"
function! s:Token.New(language, name, context)
    let token = copy(self)

    let atom.name = a:name
    let atom.context = a:context
    let atom.language = a:language
    
    return token
endfunction

"
function! s:Token.BuildRegex(regexs)
    let regex = reduce(regexs, { str, value -> str . "\|" .  value }, "")
    return "\%(" . regex . "\)"
endfunction

"
function! s:Token.SearchRegex()
endfunction

