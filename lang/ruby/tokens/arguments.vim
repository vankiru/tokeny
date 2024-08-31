"
function! g:Ruby.tokens.RegisterArguments()
    call g:Ruby.tokens.RegisterComma()
    call g:Ruby.tokens.RegisterArt()
    call g:Ruby.tokens.RegisterArts()
    call g:Ruby.tokens.RegisterBarbs()
endfunction

"
" ',\s*\n\='
function! g:Ruby.tokens.RegisterComma()
    call g:Ruby.Register('comma', #{token: ',\s*\n\='}, #{token: 'vwh'})
endfunction

" prefix = '\%(*\|**\|&\)\='
" name = '\<{snake_name}\>'
" default = '\s*=\s*{value}'
" keyward = ':\s*{value}\=' 
" suffix = '\%(,\s*\|\%()\||\)\@=\)'
" '{prefix}{name}\%({default}\|{keyward}\)\={suffix}'
" '\%(*\|**\|&\|\.\.\.\)'
function! g:Ruby.tokens.RegisterArt()
    let regex = #{
        \name: '{tags.snake_name}',
        \body: '{base.exp}',
        \token: g:ArtRegex()
    \}

    let select = #{
        \name: 'snake_name',
        \body: 'i.argument',
        \token: 'a.argument'
    \}

    call g:Ruby.Register('art', regex, select)
endfunction

function! g:ArtRegex()
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
function! g:Ruby.tokens.RegisterArts()
    let regex = #{
        \body: '{tags.snake_text}',
        \token: '\%({base.method_name}\|->\s*\)\@<=({body}'
    \}

    let select = #{body: 'vi(', token: 'va('}

    call g:Ruby.Register('arts', regex, select)
endfunction

"
" '{\s*{barbs}'
function! g:Ruby.tokens.RegisterBarbs()
    let regex = #{
        \body: '{tags.snake_text}',
        \token: '\%({\s*\)\@<=|{body}|'
    \}

    let select = #{body: 'lvf|h', token: 'vf|'}

    call g:Ruby.Register('barbs', regex, select)
endfunction
