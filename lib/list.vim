" ClASS: List
"============================================================

let s:List = {}
let g:List = s:List

"
function! s:List.New(language)
    let list = copy(self)
    let list.language = a:language

    return list
endfunction

"
function! s:List.BuildParam(name, regex)
    for atom in self.list
        execute("let " . atom . " = self." . atom . ".params[name]")
    endfor

    execute("let value = " . regex)
    return value
endfunction
