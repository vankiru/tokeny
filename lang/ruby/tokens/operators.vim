"
" "\w\+\zs\[.*\]"
function! g:Ruby.tokens.RegisterIndex()
    let regex = #{token: '\%(\w\|[\])}!?]\)\@<=['}

    let commands = #{
        \change: "",
        \chunk: ""
    \}

    call g:Ruby.Register("index", regex, commands)
endfunction

"
function! g:Ruby.tokens.RegisterOperators()
    " "\w\+\zs\[.*\]"
    call self.RegisterIndex()
    " " = "
    call g:Ruby.Register("set_to", #{token: '\s*\%([<=]\)\@<!=\%([=>]\)\@!\s*'})
    " " + "
    call g:Ruby.Register("plus", #{token: '\s*+\%(=\)\@!\s*'})
    " " - "
    call g:Ruby.Register("minus", #{token: '\s*-\%([=>]\)\@!\s*'})
    " " \* "
    call g:Ruby.Register("multi", #{token: '\%(\w\|[)}\]?!]\)\@<=\s\*\s*\%(\w\)\@='})
    " " \/ "
    call g:Ruby.Register("divide", #{token: '\s*\/\s*'})
    " " % "
    call g:Ruby.Register("modulus", #{token: '\s*%\%(=\|[wWiIqsr]\W\)\@!\s*'})
    " "\*\*"
    call g:Ruby.Register("power", #{token: '\%(\w\|[)}\]?!]\)\@<=\s\*\*\s*\%(\w\)\@='})
    " " += "
    call g:Ruby.Register("plus_equal", #{token: '\s*+=\s*'})
    " " -= "
    call g:Ruby.Register("minus_equal", #{token: '\s*-=\s*'})
    " " \*= "
    call g:Ruby.Register("multi_equal", #{token: '\s*\*=\s*'})
    " " \/= "
    call g:Ruby.Register("divide_equal", #{token: '\s*\/=\s*'})
    " " %= "
    call g:Ruby.Register("mod_equal", #{token: '\s*%=\s*'})
    " " \*\*= "
    call g:Ruby.Register("power_equal", #{token: '\s*\*\*=\s*'})
    " " == "
    call g:Ruby.Register("equal", #{token: '\s*\%([=]\)\@<!==\%([=]\)\@!\s*'})
    " " != "
    call g:Ruby.Register("not_equal", #{token: '\s*!=\s*'})
    " " > "
    call g:Ruby.Register("great", #{token: '\s*\%([=->]\)\@<!>\%(>\)\@!\s*'})
    " " < "
    call g:Ruby.Register("less", #{token: '\s*\%(<\)\@<!<\%([<=]\)\@!\s*'})
    " " >= "
    call g:Ruby.Register("great_equal", #{token: '\s*>=\s*'})
    " " <= "
    call g:Ruby.Register("less_equal", #{token: '\s*<=\%(>\)\@!\s*'})
    " " <=> "
    call g:Ruby.Register("compare", #{token: '\s*<=>\s*'})
    " " === "
    call g:Ruby.Register("test_equal", #{token: '\s*===\s*'})
    " " &&\|and "
    call g:Ruby.Register("and", #{token: '\%(\s*&&\s*\|\s\+\<and\>\s\+\)'})
    " " ||\|or "
    call g:Ruby.Register("or", #{token: '\%(\s*||\s*\|\s\+\<or\>\s\+\)'})
    " " !\|not "
    call g:Ruby.Register("not", #{token: '\%(^\|\s\+\)\%(!\|not\s\+\)'})
    " " in "
    call g:Ruby.Register("in", #{token: '\s\+\<in\>\s\+'})
    " " => "
    call g:Ruby.Register("match", #{token: '\s*\%(<\)\@<!=>\s*'})
    " " & "
    call g:Ruby.Register("bit_and", #{token: '\s*\%(&\)\@<!&\%([&\.]\|\h\)\@!\s*'})
    " " | "
    call g:Ruby.Register("bit_or", #{token: '\s*\%(|\)\@<!|\%(|\)\@!\s*'})
    " " ^ "
    call g:Ruby.Register("bit_ex", #{token: '\s*^\s*'})
    " " ~"
    call g:Ruby.Register("bit_not", #{token: '\s*\%(<<\)\@<!\~'})
    " " << "
    call g:Ruby.Register("shift_left", #{token: '\s*\%(\<class\>\s\+\)\@<!<<\%([-~\U]\)\@!\s*'})
    " " >> "
    call g:Ruby.Register("shift_right", #{token: '\s*>>\s*'})
endfunction
