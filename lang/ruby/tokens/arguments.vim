let s:Ruby = g:Ruby
let s:tokens = g:Ruby.tokens

" type = "\%(*\|**\|&\)\="
" name = "\<{base_name}\>"
" default = "\s*=\s*{value}"
" keyward = ":\s*{value}\=" 
" suffix = "\%(,\s*\|\%()\||\)\@=\)"
" "{type}{name}\%({default}\|{keyward}\)\={suffix}"
" "\%(*\|**\|&\|\.\.\.\)"
function! s:tokens.RegisterArt()
    let l:type = '"\%(\*\|\*\*\|&\)\="'
    let default = '"%w(\s*=\s*" . body'
    let keyward = '"\|:\s*" . body . "\=\)\=" '
    let suffix = '"\%(,\s*\|\%()\||\)\@=\)"'

    let search = [
        \l:type . " . name . " . default . keyward . suffix,
        \"\%(\*\|\*\*\|&\|\.\.\.\)"
    \]

    let params = #{
        \name: "atoms.variable_name",
        \body: "",
        \search: g:BuildRegex(search)
    \}

    call s:Ruby.RegisterToken("art", params)
endfunction

"
" "\%({method_name}\|->\s*\){atom_args}"
function! s:tokens.RegisterArts()
    let params = #{
        \name: "atoms.variable_name",
        \search: '"\%(" . atoms.method_name . "\|->\s*\)" . atoms.arts"'
    \}

    call s:Ruby.RegisterToken("arts", params)
endfunction

""{\s*{atom_barbs}"
