let s:Ruby = g:Ruby

function! s:Ruby:tokens.RegisterBlock()
    let multi = "\(\<\%(while\|until\|for\)/>\s\+.\{-}\)\@<!\s\+\<do\>\s*".base.barbs."\=$".body
    let inline = "\%(->\s*\|)\s*\|".base.method_name."\)\@<=\s*{\s*".base.barbs."\=\s*".body

    let regex = #{
        \body: "[^}]"
        \token: '\%('.multi.'\|'.inline.'\)'
    \}

    let select = #{
        \body: ["vir", "vi{"]
        \token: ["var", "va{oh"]
    \}

    call s:Ruby.Register("block", regex, select)
endfunction
