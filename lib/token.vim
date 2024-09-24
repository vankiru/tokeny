" ClASS: Token
" atoms
" name
" inputs = {
"  name
"  Input
" }
" search = {
"   name
"   body
"   test
"   token
" }
" select = {
"   name
"   body
"   test
"   token
" }
"============================================================
let s:Token = {}
let g:Token = s:Token

"
function! s:Token.New(language, input, search, select)
    let token = copy(self)

    let token.input = g:Input.New(a:input)
    "let token.search = g:Search.New(a:search, a:language)
    "let token.select = g:Select.New(a:select)

    return token
endfunction

"
function! s:Token.Regex(id, key)
    let id = a:id
    execute('return '.self.search[a:key])
endfunction

function! s:Token.GoTo(id = '', key = 'token')
    call search(self.Regex(a:id, a:key))
endfunction

function! s:Token.GoBack(id = '', key = 'token')
    call search(self.Regex(a:id, a:key), 'b')
endfunction

function! s:Token.Insert(variation, values)
    call self.input.Insert(a:variation, a:values)
endfunction

