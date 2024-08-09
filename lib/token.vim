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





let regex = "\<def\>\s*{name}\%({args}\)\=\n{body}\<end\>"
let regex = '"\<def\>\s*" . name . "\%(" . args . "\)\=\n" . body . "\<end\>"'

Ruby.tokens.anon.arts
Ruby.tokens.ided.arts
