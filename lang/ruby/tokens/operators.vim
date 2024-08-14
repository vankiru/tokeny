"
" "\w\+\zs\[.*\]"
function! s:tokens.RegisterIndex()
    let regex = #{search: '\%(\w\|[\])}!?]\)\@<=['}

    let commands = #{
        \change: "",
        \chunk: ""
    \}

    call s:Ruby.Register("index", regex, commands)
endfunction

"
function! s:tokens.RegisterOperators()
    " "\w\+\zs\[.*\]"
    call self.RegisterIndex()
    " " = "
    call s:Ruby.Register("set_to", #{search: '\s*\%([<=]\)\@<!=\%([=>]\)\@!\s*'})
    " " + "
    call s:Ruby.Register("plus", #{search: '\s*+\%(=\)\@!\s*'})
    " " - "
    call s:Ruby.Register("minus", #{search: '\s*-\%([=>]\)\@!\s*'})
    " " \* "
    call s:Ruby.Register("multi", #{search: '\%(\w\|[)}\]?!]\)\@<=\s\*\s*\%(\w\)\@='})
    " " \/ "
    call s:Ruby.Register("divide", #{search: '\s*\/\s*'})
    " " % "
    call s:Ruby.Register("modulus", #{search: '\s*%\%(=\|[wWiIqsr]\W\)\@!\s*'})
    " "\*\*"
    call s:Ruby.Register("power", #{search: '\%(\w\|[)}\]?!]\)\@<=\s\*\*\s*\%(\w\)\@='})
    " " += "
    call s:Ruby.Register("plus_equal", #{search: '\s*+=\s*'})
    " " -= "
    call s:Ruby.Register("minus_equal", #{search: '\s*-=\s*'})
    " " \*= "
    call s:Ruby.Register("multi_equal", #{search: '\s*\*=\s*'})
    " " \/= "
    call s:Ruby.Register("divide_equal", #{search: '\s*\/=\s*'})
    " " %= "
    call s:Ruby.Register("mod_equal", #{search: '\s*%=\s*'})
    " " \*\*= "
    call s:Ruby.Register("power_equal", #{search: '\s*\*\*=\s*'})
    " " == "
    call s:Ruby.Register("equal", #{search: '\s*\%([=]\)\@<!==\%([=]\)\@!\s*'})
    " " != "
    call s:Ruby.Register("not_equal", #{search: '\s*!=\s*'})
    " " > "
    call s:Ruby.Register("great", #{search: '\s*\%([=->]\)\@<!>\%(>\)\@!\s*'})
    " " < "
    call s:Ruby.Register("less", #{search: '\s*\%(<\)\@<!<\%([<=]\)\@!\s*'})
    " " >= "
    call s:Ruby.Register("great_equal", #{search: '\s*>=\s*'})
    " " <= "
    call s:Ruby.Register("less_equal", #{search: '\s*<=\%(>\)\@!\s*'})
    " " <=> "
    call s:Ruby.Register("compare", #{search: '\s*<=>\s*'})
    " " === "
    call s:Ruby.Register("test_equal", #{search: '\s*===\s*'})
    " " &&\|and "
    call s:Ruby.Register("and", #{search: '\%(\s*&&\s*\|\s\+\<and\>\s\+\)'})
    " " ||\|or "
    call s:Ruby.Register("or", #{search: '\%(\s*||\s*\|\s\+\<or\>\s\+\)'})
    " " !\|not "
    call s:Ruby.Register("not", #{search: '\%(^\|\s\+\)\%(!\|not\s\+\)'})
    " " in "
    call s:Ruby.Register("in", #{search: '\s\+\<in\>\s\+'})
    " " => "
    call s:Ruby.Register("match", #{search: '\s*\%(<\)\@<!=>\s*'})
    " " & "
    call s:Ruby.Register("bit_and", #{search: '\s*\%(&\)\@<!&\%([&\.]\|\h\)\@!\s*'})
    " " | "
    call s:Ruby.Register("bit_or", #{search: '\s*\%(|\)\@<!|\%(|\)\@!\s*'})
    " " ^ "
    call s:Ruby.Register("bit_ex", #{search: '\s*^\s*'})
    " " ~"
    call s:Ruby.Register("bit_not", #{search: '\s*\%(<<\)\@<!\~'})
    " " << "
    call s:Ruby.Register("shift_left", #{search: '\s*\%(\<class\>\s\+\)\@<!<<\%([-~\U]\)\@!\s*'})
    " " >> "
    call s:Ruby.Register("shift_right", #{search: '\s*>>\s*'})
endfunction
