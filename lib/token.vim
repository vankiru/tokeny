" ClASS: Token
" context = {
"   name
"   body
"   test
" }
" search_regex
" name_regex
" body_regex
" test_regex
" type
"============================================================

let s:Token = {}
let g:Token = s:Token

"
function! s:Token.New(name, context, regex)
    let token = copy(self)

    let token.name = a:name
    let token.context = a:context
    let token.regex = token.BuildRegex(a:regex)
    
    return token
endfunction

"
function! s:Token.BuildRegex(regexs)
    let regex = reduce(regexs, { str, value -> str . "\|" .  value }, "")
    return "\%(" . regex . "\)"
endfunction

"
function! s:Token.SearchRegex()
    let regex = reduce(regexs, { str, value -> str . "\|" .  value }, "")
    return "\%(" . regex . "\)"
endfunction

#
function! s:Token.SearchRegex(regexs)
    let regex = reduce(regexs, { str, value -> str . "\|" .  value }, "")
    return "\%(" . regex . "\)"
endfunction

