" ClASS: Token
" atoms
" name
" regex = {
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
function! s:Token.New(language, name, regex, select)
    let token = copy(self)

    let token.name = a:name
    let token.select = a:select
    let token.language = a:language
    let token.regex = token.PrepareRegex(a:regex)

    return token
endfunction

function! s:Token.PrepareRegex(regex)
    return map(
        \copy(a:regex),
        \{key, _ -> self.BuildRegex(a:regex, key)}
    \)
endfunction

function! s:Token.BuildRegex(regex, type)
    let base = self.language.atoms.base
    let tags = self.language.atoms.tags

    for key in ['name', 'test', 'body', 'token']
        let value = get(a:regex, key, '')

        if key ==? a:type && key != 'token'
          let value = '\zs'.value.'\ze'
        endif

        let value = self.InterpolateRegex(value)

        execute('let '.key.' = '.value)
    endfor

    return self.InterpolateRegex(token)
endfunction

function! s:Token.InterpolateRegex(regex)
    let pat = '{\(\w\+\%(\.\w\+\)\=\)}'
    let Sub = {match -> "'.".match[1].".'"}

    let result = substitute(a:regex, pat, Sub, 'g')

    return "'".result."'"
endfunction

function! s:Token.Regex(id, key = 'token')
    let id = a:id

    execute('return '.self.regex[a:key])
endfunction

