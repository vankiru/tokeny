let s:Ruby = g:Ruby
let s:atoms = g:Ruby.atoms

"
" "({arg}*)"
" "(.*)"
function! s:atoms.RegisterArts()
    let params = #{
        \name: 'id . ".\{-}"',
        \search: '"(" . name . ".*)"'
    \}

    call s:Ruby.RegisterAtom("arts", params)
endfunction

"
" "|{arg}*|"
" "|.*|"
function! s:atoms.RegisterBarbs()
    let params = #{
        \name: 'id . ".\{-}"',
        \search: '"|" . name . ".*|"'
    \}

    call s:Ruby.RegisterAtom("barbs", params)
endfunction

" {name}
" {name} = {value}
" {name}:
" {name}: {value}
" *{name}
" **{name}
" &{name}
" *
" **
" &
" ...
"
" {arg}, 
" {arg})
" {arg}|
"
" m(arg, arg)
" m((arg, arg))
" m arg, arg
