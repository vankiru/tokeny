" ClASS: Atom
" language
" name
" params = {
"   name
"   body
"   test
"   search
" }
" NameRegex
" BodyRegex
" TestRegex
" SearchRegex
"============================================================
let s:Atom = {}
let g:Atom = s:Atom

"
function! s:Atom.New(language, name, params)
    let atom = copy(self)

    let atom.language = a:language
    let atom.name = a:name
    let atom.params = a:params

    return atom
endfunction

"
function! s:Atom.EvaluateRegex(regex, type, id)
    let id = a:id

    for key in self.params
      execute("let " . key . " = self.EvaluateContext(" . key . ", a:type, id)")
    endfor

    exec("let result = " . a:regex)

    return result
endfunction

"
function! s:Atom.EvaluateContext(key, type, id)
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
function! s:Atom.SearchRegex(id = "")
    return self.EvaluateRegex(self.regex, "all", a:id)
endfunction

"
function! s:Atom.NameRegex(id = "")
    return self.EvaluateRegex(self.regex, "name", a:id)
endfunction

"
function! s:Atom.BodyRegex(id = "")
    return self.EvaluateRegex(self.regex, "body", a:id)
endfunction
