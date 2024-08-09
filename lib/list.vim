" ClASS: List
"============================================================

let s:Atoms = {}
let g:Atoms = s:Atoms

"
function! s:Atoms.Register(name, context, regex)
    let self.name = g:Atom.new(name, context, regex)
endfunction
