" ClASS: Atom
" context = {
"   name: "",
"   body: "",
"   test: ""
" }
" search_regex
" name_regex
" body_regex
" test_regex
"============================================================

let s:Atom = {}
let g:Atom = s:Atom

function s:Atom.new()
    let l:atom = copy(self)
    return l:atom
endfunction

function! s:Atom.BuildContext(template)
    let context = #{
        \anon: BuildFromContext(template, "anon"),
        \ided: BuildFromContext(template, "ided"),
    \}

    return context
endfunction

function! s:Atom.BuildFromContext(template, type)
    let context = {}

    for key in keys(template)
        context[key] = exec("self." . template[key] . a:type)
    endfor

    return context
endfunction

