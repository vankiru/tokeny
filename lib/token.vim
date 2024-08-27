" ClASS: Token
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
" atoms
" NameRegex
" BodyRegex
" TestRegex
" SearchRegex
"============================================================
let s:Token = {}
let g:Token = s:Token

"
function! s:Token.New(language, name, regex, select)
    let token = copy(self)

    let token.name = a:name
    let token.regex = self._A(a:regex)
    let token.select = a:select

    let atoms = a:language.atoms

    return token
endfunction

function! s:Token._A(regex)
    #{
        \name: self.PrepareRegex(a:regex, 'name'),
        \body: self.PrepareRegex(a:regex, 'body'),
        \test: self.PrepareRegex(a:regex, 'test'),
        \token: self.PrepareRegex(a:regex)
    \}
endfunction

"
function! s:Token.EvaluateRegex(type = 'none')
    let base = self.atoms.base
    let tags = self.atoms.tags

    for key in ['name', 'test', 'body', 'token']
        let regex = self.PrepareRegex(self.regex[key])

        execute('let '.key.' = '.regex)

        if key ==? a:type
          let value = '\zs'.value.'\ze'
        endif
    endfor

    return self.PrepareRegex(token)
endfunction

"
function! s:Token.PrepareRegex(regex)
    let pat = '{\(\w\+\%(\.\w\+\)\=\)}'
    let sub = {match -> "'.".match[1].".'"}

    let result = substitute(a:regex, pat, sub, 'g')

    return "'".result."'"
endfunction



"
function! s:Token.EvaluateRegex(id, type = '')
    let id = a:id
    let base = self.atoms.base
    let name = self.atoms.name

    for key in ['name', 'test', 'body', 'token']
        execute('let value = '.self.regex[key])

        if key ==? a:type
          let value = '\zs'.value.'\ze'
        endif

        execute('let '.key.' = '.value)
    endfor

    return token
endfunction

"
function! s:Token.SearchRegex(id = '')
    return self.EvaluateRegex(a:id)
endfunction

function! s:Token.NameRegex(id = '')
    return self.EvaluateRegex(a:id, 'name')
endfunction

function! s:Token.TestRegex(id = '')
    return self.EvaluateRegex(a:id, 'test')
endfunction

function! s:Token.BodyRegex(id = '')
    return self.EvaluateRegex(a:id, 'body')
endfunction
