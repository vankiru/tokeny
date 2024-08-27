" ClASS: Language
" atoms
" tokens
"============================================================

let s:Language = #{atoms: {}, tokens: {}}
let g:Language = s:Language

let s:Language.select = #{
    \snake_name: "ve",
    \method_name: "",
    \class_name: "vic",
    \const_name: "ve",
    \line: "v$h",
    \i: #{
        \argument: "via",
        \block: "vir",
        \arts: "",
        \barbs: "",
    \},
    \a: #{
        \argument: "via",
        \block: "vir",
        \arts: "",
        \barbs: "",
    \}
\}

function! s:Language.New()
    let language = copy(self)
    return language
endfunction

"
function! s:Language.Register(name, regex, select)
    let self.tokens[a:name] = g:Token.New(self, a:name, a:regex, a:select)
endfunction
