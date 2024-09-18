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

    let token.language = a:language

    let token.input = a:input
    let token.select = a:select
    let token.search = token._prepareRegex(a:search)

    return token
endfunction

" Building name, test, body and token regexes
function! s:Token._prepareRegex(regex)
    return map(
        \copy(a:regex),
        \{key, _ -> self._buildRegex(a:regex, key)}
    \)
endfunction

function! s:Token._buildRegex(regex, type)
    let base = self.language.atoms.base
    let tags = self.language.atoms.tags

    for key in ['name', 'test', 'body', 'token']
        let value = get(a:regex, key, '')

        if key ==? a:type && key != 'token'
          let value = '\zs'.value.'\ze'
        endif

        let value = self._interpolateRegex(value)

        execute('let '.key.' = '.value)
    endfor

    return self._interpolateRegex(token)
endfunction

function! s:Token._interpolateRegex(regex)
    let pat = '{\(\w\+\%(\.\w\+\)\=\)}'
    let Sub = {match -> "'.".match[1].".'"}

    let result = substitute(a:regex, pat, Sub, 'g')

    return "'".result."'"
endfunction

"
function! s:Token.Regex(id, key)
    let id = a:id

    execute('return '.self.search[a:key])
endfunction

"function! s:Token.GoTo(id, key)
function! s:Token.GoTo(id = '', key = 'token')
    call search(self.Regex(a:id, a:key))
endfunction

"function! s:Token.GoBack(id, key)
function! s:Token.GoBack(id = '', key = 'token')
    call search(self.Regex(a:id, a:key), 'b')
endfunction

