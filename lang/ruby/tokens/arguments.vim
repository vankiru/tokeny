let s:Ruby = g:Ruby

"
" ',\s*\n\='
function! s:Ruby.tokens.RegisterComma()
    call s:Ruby.Register('comma', #{token: ',\s*\n\='}, #{token: 'vwh'})
endfunction

" prefix = '\%(*\|**\|&\)\='
" name = '\<{snake_name}\>'
" default = '\s*=\s*{value}'
" keyward = ':\s*{value}\=' 
" suffix = '\%(,\s*\|\%()\||\)\@=\)'
" '{prefix}{name}\%({default}\|{keyward}\)\={suffix}'
" '\%(*\|**\|&\|\.\.\.\)'
function! s:Ruby.tokens.RegisterArt()
    let regex = #{
        \name: '{tags.snake_name}',
        \body: '{base.expression}',
        \token: s:ArtRegex()
    \}

    let select = #{
        \name: 'snake_name',
        \body: 'i.argument',
        \token: 'a.argument'
    \}

    call s:Ruby.Register('art', regex, select)
endfunction

function! s:ArtRegex()
    let prefix = '\%(\*\|\*\*\|&\)\='
    let name = '{name}'
    let default = '\s*=\s*{body}'
    let keyward = ':\s*{body}\='
    let suffix = '\%(,\s*\|\%(|\|)\)\)\@='

    let art = prefix.name.'\%('.default.'\|'.keyward.'\)\='.suffix
    let forward = '\%(\*\|\*\*\|&\|\.\.\.\)'

    return '\%('.art.'\|'.forward.'\)'
endfunction

"
" '\%({method_name}\|->\s*\)({id}'
function! s:Ruby.tokens.RegisterArts()
    let regex = #{
        \body: '{tags.snake_text}',
        \token: '\%({base.method_name}\|->\s*\)\@<=({body}'
    \}

    let select = #{body: 'vi(', token: 'va('}

    call s:Ruby.Register('arts', regex, select)
endfunction

"
" '{\s*{barbs}'
function! s:Ruby.tokens.RegisterBarbs()
    let regex = #{
        \body: '{tags.snake_text}',
        \token: '\%({\s*\)\@<=|{body}|'
    \}

    let select = #{body: 'lvf|h', token: 'vf|'}

    call s:Ruby.Register('barbs', regex, select)
endfunction
