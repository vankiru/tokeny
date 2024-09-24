"
" Building name, test, body and token regexes
function! g:PrepareRegex(regex, atoms)
    return map(
        \copy(a:regex),
        \{key, _ -> s:BuildRegex(a:regex, key, a:atoms)}
    \)
endfunction

function! s:BuildRegex(regex, type, atoms)
    let base = atoms.base
    let tags = atoms.tags

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
