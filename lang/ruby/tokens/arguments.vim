let s:tokens = g:Ruby.tokens
let s:named = g:Ruby.atoms.named
let s:noname = g:Ruby.atoms.noname

" type = "\%(*\|**\|&\)\="
" name = "\<{base_name}\>"
" default = "\s*=\s*{value}"
" keyward = ":\s*{value}\=" 
" suffix = "\%(,\s*\|\%()\||\)\@=\)"
" "{type}{name}\%({default}\|{keyward}\)\={suffix}"
" "\%(*\|**\|&\|\.\.\.\)"
function! s:tokens.RegisterArt()
    let l:type = '''\%(\*\|\*\*\|&\)\='''
    let default = '''%w(\s*=\s*'' . body'
    let keyward = '''\|:\s*'' . body . ''\=\)\='''
    let suffix = '\%(,\s*\|\%()\||\)\@=\)'

    let search = [
        \l:type . ' . name . ' . default . keyward . suffix,
        \'\%(\*\|\*\*\|&\|\.\.\.\)'
    \]

    let regex = #{
        \name: 'atoms.snake_name',
        \body: '',
        \search: g:BuildRegex(search)
    \}

    call s:Ruby.Register("art", regex)
endfunction

"
" ",\s*\n\="
function! s:tokens.RegisterComma()
    call s:Ruby.Register("comma", #{search: ',\s*\n\='})
endfunction

"
" "\%({method_name}\|->\s*\)({id}"
function! s:tokens.RegisterArts()
    let regex = #{
        \search: '\%(' . s:noname.method_name . '\|->\s*\)\@<=(' . s:named.snake_text'
    \}

    let commands = #{
        \change: s:commands.NormalMode("vi(d"),
        \chunk: s:commands.NormalMode("va(d")
    \}

    call s:Ruby.Register("arts", regex, commands)
endfunction

"
" "{\s*{barbs}"
function! s:tokens.RegisterArts()
    let regex = #{
        \body: named.snake_text,
        \search: '''\%({\s*\)\@<=|'' . body . ''|'''
    \}

    call s:Ruby.Register("arts", regex)
endfunction
