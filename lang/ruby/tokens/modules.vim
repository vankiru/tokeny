" "module {id}",
function! s:tokens.RegisterModule()
    let regex = #{
        \name: named.class_name,
        \search: "\<module\>\s\+".name
    \}

    let commands = #{}

    call s:Ruby.Register("module", regex, commands)
endfunction

"
" "refine {id}",
function! s:tokens.RegisterRefine()
    let regex = #{
        \name: named.class_name,
        \search: "\<refine\>\s\+".name
    \}

    let commands = #{}

    call s:Ruby.Register("refine", regex, commands)
endfunction

"
" "include {id}",
function! s:tokens.RegisterInclude()
    let regex = #{
        \name: named.class_name,
        \search: "\<include\>\s\+".name
    \}

    call s:Ruby.Register("include", regex)
endfunction

"
" "extend {id}",
function! s:tokens.RegisterExtend()
    let regex = #{
        \name: named.class_name,
        \search: "\<extend\>\s\+".name
    \}

    call s:Ruby.Register("extend", regex)
endfunction

"
" "using {id}",
function! s:tokens.RegisterUsing()
    let regex = #{
        \name: named.class_name,
        \search: "\<using\>\s\+".name
    \}

    call s:Ruby.Register("using", regex)
endfunction
