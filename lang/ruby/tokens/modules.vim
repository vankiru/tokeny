" "module {id}",
function! g:Ruby.tokens.RegisterModule()
    let regex = #{
        \name: tags.class_name,
        \token: "\<module\>\s\+".name
    \}

    let commands = #{}

    call g:Ruby.Register("module", regex, commands)
endfunction

"
" "refine {id}",
function! g:Ruby.tokens.RegisterRefine()
    let regex = #{
        \name: tags.class_name,
        \token: "\<refine\>\s\+".name
    \}

    let commands = #{}

    call g:Ruby.Register("refine", regex, commands)
endfunction

"
" "include {id}",
function! g:Ruby.tokens.RegisterInclude()
    let regex = #{
        \name: tags.class_name,
        \token: "\<include\>\s\+".name
    \}

    call g:Ruby.Register("include", regex)
endfunction

"
" "extend {id}",
function! g:Ruby.tokens.RegisterExtend()
    let regex = #{
        \name: tags.class_name,
        \token: "\<extend\>\s\+".name
    \}

    call g:Ruby.Register("extend", regex)
endfunction

"
" "using {id}",
function! g:Ruby.tokens.RegisterUsing()
    let regex = #{
        \name: tags.class_name,
        \token: "\<using\>\s\+".name
    \}

    call g:Ruby.Register("using", regex)
endfunction
