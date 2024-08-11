let atoms.a = #{
    \snake_name: "\<\h\w*\>",
    \snake_text: "\h\w*.\{-}",
    \method_name: "\<\h\w*\>[!?]\=",
    \class_name: "\%(::\)\=\<\u\w*\>\%(::\<\u\w*\>\)*",
    \arts: "(.\{-})",
    \barbs: "|.\{-}|",
    \block: "",
    \text: ".\{-}"
\}

let atoms.named = #{
    \snake_name: '"\<" . id . "\w*\>"',
    \snake_text: 'id . "\w*.\{-}"',
    \method_name: '"\<" . id . "\w*\>[!?]\="',
    \class_name: '"\%(::\)\=\<" . id . "\w*\>\%(::\<\u\w*\>\)*"',
    \arts: '"(" . id . ".\{-})"',
    \barbs: '"|" . id . ".\{-}|"',
    \block: "",
    \text: 'id . ".\{-}"'
\}
