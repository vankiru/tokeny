" ClASS: Token
" language
" name
" regex = {
"   name
"   body
"   test
"   search
" }
" commands = {
"   rename
"   change
"   test
"   chunk
" }
" NameRegex
" BodyRegex
" TestRegex
" SearchRegex
"============================================================
let s:Token = {}
let g:Token = s:Token

let s:a = ["name", "body", "test"]

"
"function! s:Token.New(language, name, params)
function! s:Token.New(language, name, regex, commands)
    let token = copy(self)

    let token.language = a:language
    let token.name = a:name
    let token.regex = a:regex
    let token.commands = a:commands
    "let token.regex = get(a:params, "regex", {})
    "let token.commands = get(a:params, "commands", {})

    return token
endfunction

"
function! s:Token.EvaluateRegex(regex, type, id)
    let id = a:id

    for key in s:a
      execute("let " . name . " = self.EvaluateParam(" . name . ", a:type, id)")
    endfor

    execute("let result = " . a:regex)

    return result
endfunction

"
function! s:Token.EvaluateParam(name, type, id)
    let id = a:id

    if a:key ==? a:type
      let evaluation = "\zs" . self.params[a:key] . "\ze"
    else
      let evaluation = self.params[a:key]
    endif

    execute("let value = " . evaluation)

    return value
endfunction

"
function! s:Token.SearchRegex(id = "")
    return self.EvaluateRegex(self.regex, "all", a:id)
endfunction

"
function! s:Token.NameRegex(id = "")
    return self.EvaluateRegex(self.regex, "name", a:id)
endfunction

"
function! s:Token.BodyRegex(id = "")
    return self.EvaluateRegex(self.regex, "body", a:id)
endfunction

"
function! s:Token.TestRegex(id = "")
    return self.EvaluateRegex(self.regex, "test", a:id)
endfunction
