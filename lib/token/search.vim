" CLASS: Search
"

let s:Search = {}
let g:Search = s:Search

function! s:Search.New(regex, language)
    let search = copy(self)

    let search.regex = s:PrepareRegex(a:regex, a:language)

    return search
endfunction

function! s:Search.Regex(id, key)
    let id = a:id
    execute('return '.self.regex[a:key])
endfunction

function! s:PrepareRegex(regex, language)
    let atoms = a:language.atoms

    return map(
        \copy(a:regex),
        \{type, _ -> s:PrepareTypeRegex(a:regex, type, atoms)}
    \)
endfunction

function! s:PrepareTypeRegex(regex, type, atoms)
    let base = a:atoms.base
    let tags = a:atoms.tags

    for key in ['name', 'test', 'body', 'token']
        let value = get(a:regex, key, '')

        if key ==? a:type && key != 'token'
          let value = '\zs'.value.'\ze'
        endif

        let value = g:InterpolateString(value)

        execute('let '.key.' = '.value)
    endfor

    return g:InterpolateString(token)
endfunction
