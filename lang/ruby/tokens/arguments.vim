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
    let input = #{
        \base: #{type: 'after', text: ','}
    \}

    let search = #{token: ',\s*\n\='}
    let select = #{token: 'char'}

    call g:Ruby.Register('comma', input, search, select)
endfunction

" prefix = '\%(*\|**\|&\)\='
" name = '\<{snake_name}\>'
" default = '\s*=\s*{value}'
" keyward = ':\s*{value}\=' 
" suffix = '\%(,\s*\|\%()\||\)\@=\)'
" '{prefix}{name}\%({default}\|{keyward}\)\={suffix}'
" '\%(*\|**\|&\|\.\.\.\)'
function! g:Ruby.tokens.RegisterArt()
    let input = #{
        \list: #{type: 'space', text: '*{value}'},
        \hash: #{type: 'space', text: '**{value}'},
        \block: #{type: 'space', text: '&{value}'},
        \forward: #{type: 'after', text: '...'},
        \default: #{type: 'space', text: '{value} = '}
    \}

    let search = #{
        \name: '{tags.snake_name}',
        \body: '{base.exp}',
        \token: s:ArtRegex()
    \}

    let select = #{
        \name: 'snake_name',
        \body: 'i.argument',
        \token: 'a.argument'
    \}

    call g:Ruby.Register('art', input, search, select)
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
function! g:Ruby.tokens.RegisterArts()
    let input = #{
        \base: #{type: 'after', text: '()', move: 1},
        \left: #{type: 'after', text: '('},
        \right: #{type: 'after', text: ')'}
    \}

    let search = #{
        \body: '{tags.snake_text}',
        \token: '\%({base.method_name}\|->\s*\)\@<=({body}'
    \}

    let select = #{body: 'i.arts', token: 'a.arts'}

    call g:Ruby.Register('arts', input, search, select)
endfunction

"
" '{\s*{barbs}'
function! g:Ruby.tokens.RegisterBarbs()
    let input = #{
        \base: #{type: 'space', text: '||', move: 1},
        \single: #{type: 'after', text: '|'}
    \}

    let search = #{
        \body: '{tags.snake_text}',
        \token: '\%({\s*\)\@<=|{body}|'
    \}

    let select = #{body: 'i.barbs', token: 'a.barbs'}

    call g:Ruby.Register('barbs', input, search, select)
endfunction
