let s:Ruby = g:Ruby
let s:tokens = g:Ruby.tokens

let s:atoms = s:Ruby.atoms.noname

function! s:tokens.RegisterBlock()
    let multi = '\(\<\%(while\|until\|for\)/>\s\+.\{-}\)\@<!\s\+\<do\>\s*' . s:atoms.barbs . '\=$'
    let inline = '\%(->\s*\|)\s*\|' . s:atoms.method_name . '\)\@<=\s*{'

    let regex = #{
        \search: '\%(' . multi . '\|' . inline . '\)'
    \}

    let commands = #{
        \change: s:commands.ChangeBlockOr("vwhdvi{d"),
        \chunk: s:commands.ChunkBlockOr("vwhdva{d")
    \}

    call s:Ruby.Register("block", regex)
endfunction
