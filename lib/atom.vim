" ClASS: Atom
" context = {
"   name: "",
"   body: ""
" }
" search_regex
" name_regex
" body_regex
"============================================================

let s:Atom = {}
let g:Atom = s:Atom

"
function! s:Atom.New(name, context, regex)
    let atom = copy(self)

    let atom.name = a:name
    let atom.context = a:context
    let atom.regex = atom.BuildRegex(a:regex)
    
    return atom
endfunction

"
function! s:Atom.BuildRegex(regexs)
    let regex = reduce(regexs, { str, value -> str . ' . "\|" . ' .  value }, "")
    return '"\%(" .' . regex . ' . "\)"'
endfunction

"
function! s:Atom.EvaluateRegex(regex, type, id)
    let id = a:id
    let atoms = self.atoms

    for key in self.context
      execute("let " . key . " = self.EvaluateContext(" . key . ", type, id)")
    endfor

    exec("let result = " . regex)

    return result
endfunction

"
function! s:Atom.EvaluateContext(key, type, id)
    let id = a:id
    let atoms = self.atoms

    if type ==? key
      let evaluation = "\zs" . self.context[key] . "\ze"
    else
      let evaluation = self.context[key]
    endif

    execute("let value = " . evaluation)

    return value
endfunction

"
function! s:Atom.SearchRegex(id = "")
    return self.EvaluateRegex(regex, "all", id)
endfunction

"
function! s:Atom.NameRegex(id = "")
    return self.EvaluateRegex(regex, "name", id)
endfunction

"
function! s:Atom.BodyRegex(id = "")
    return self.EvaluateRegex(regex, "body", id)
endfunction
