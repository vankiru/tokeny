" " = "
function! s:tokens.RegisterSetTo()
    call s:Ruby.Register("set_to", #{search: '\s*\%([<=]\)\@<!=\%([=>]\)\@!\s*'})
endfunction

"
" " + "
function! s:tokens.RegisterPlus()
    call s:Ruby.Register("plus", #{search: '\s*+\%(=\)\@!\s*'})
endfunction

"
" " - "
function! s:tokens.RegisterMinus()
    call s:Ruby.Register("minus", #{search: '\s*-\%([=>]\)\@!\s*'})
endfunction

"
" " \* "
function! s:tokens.RegisterMulti()
    call s:Ruby.Register("multi", #{search: '\%(\w\|[)}\]?!]\)\@<=\s\*\s*\%(\w\)\@='})
endfunction

"
" " \/ "
function! s:tokens.RegisterDivide()
    call s:Ruby.Register("divide", #{search: '\s*\/\s*'})
endfunction

"
" " % "
function! s:tokens.RegisterModulus()
    call s:Ruby.Register("modulus", #{search: '\s*%\%(=\|[wWiIqsr]\W\)\@!\s*'})
endfunction

"
" "\*\*"
function! s:tokens.RegisterPower()
    call s:Ruby.Register("power", #{search: '\%(\w\|[)}\]?!]\)\@<=\s\*\*\s*\%(\w\)\@='})
endfunction

"
" " += "
function! s:tokens.RegisterPlusEqual()
    call s:Ruby.Register("plus_equal", #{search: '\s*+=\s*'})
endfunction

"
" " -= "
function! s:tokens.RegisterMinusEqual()
    call s:Ruby.Register("minus_equal", #{search: '\s*-=\s*'})
endfunction

"
" " \*= "
function! s:tokens.RegisterMultiEqual()
    call s:Ruby.Register("multi_equal", #{search: '\s*\*=\s*'})
endfunction

"
" " \/= "
function! s:tokens.RegisterDivideEqual()
    call s:Ruby.Register("divide_equal", #{search: '\s*\/=\s*'})
endfunction

"
" " %= "
function! s:tokens.RegisterModEqual()
    call s:Ruby.Register("mod_equal", #{search: '\s*%=\s*'})
endfunction

"
" " \*\*= "
function! s:tokens.RegisterPowerEqual()
    call s:Ruby.Register("power_equal", #{search: '\s*\*\*=\s*'})
endfunction

"
" " == "
function! s:tokens.RegisterEqual()
    call s:Ruby.Register("equal", #{search: '\s*\%([=]\)\@<!==\%([=]\)\@!\s*'})
endfunction

"
" " != "
function! s:tokens.RegisterNotEqual()
    call s:Ruby.Register("not_equal", #{search: '\s*!=\s*'})
endfunction

"
" " > "
function! s:tokens.RegisterGreat()
    call s:Ruby.Register("great", #{search: '\s*\%([=->]\)\@<!>\%(>\)\@!\s*'})
endfunction

"
" " < "
function! s:tokens.RegisterLess()
    call s:Ruby.Register("less", #{search: '\s*\%(<\)\@<!<\%([<=]\)\@!\s*'})
endfunction

"
" " >= "
function! s:tokens.RegisterGreatEqual()
    call s:Ruby.Register("great_equal", #{search: '\s*>=\s*'})
endfunction

"
" " <= "
function! s:tokens.RegisterLessEqual()
    call s:Ruby.Register("less_equal", #{search: '\s*<=\%(>\)\@!\s*'})
endfunction

"
" " <=> "
function! s:tokens.RegisterCompare()
    call s:Ruby.Register("compare", #{search: '\s*<=>\s*'})
endfunction

"
" " === "
function! s:tokens.RegisterTestEqual()
    call s:Ruby.Register("test_equal", #{search: '\s*===\s*'})
endfunction

"
" " &&\|and "
function! s:tokens.RegisterAnd()
    call s:Ruby.Register("and", #{search: '\%(\s*&&\s*\|\s\+\<and\>\s\+\)'})
endfunction

"
" " ||\|or "
function! s:tokens.RegisterOr()
    call s:Ruby.Register("or", #{search: '\%(\s*||\s*\|\s\+\<or\>\s\+\)'})
endfunction

"
" " !\|not "
function! s:tokens.RegisterNot()
    call s:Ruby.Register("not", #{search: '\%(^\|\s\+\)\%(!\|not\s\+\)'})
endfunction

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
" " in "
function! s:tokens.RegisterIn()
    call s:Ruby.Register("in", #{search: '\s\+\<in\>\s\+'})
endfunction

"
" " => "
function! s:tokens.RegisterMatch()
    call s:Ruby.Register("match", #{search: '\s*\%(<\)\@<!=>\s*'})
endfunction

"
" " & "
function! s:tokens.RegisterBitAnd()
    call s:Ruby.Register("bit_and", #{search: '\s*\%(&\)\@<!&\%([&\.]\|\h\)\@!\s*'})
endfunction

"
" " | "
function! s:tokens.RegisterBitOr()
    call s:Ruby.Register("bit_or", #{search: '\s*\%(|\)\@<!|\%(|\)\@!\s*'})
endfunction

"
" " ^ "
function! s:tokens.RegisterBitEx()
    call s:Ruby.Register("bit_ex", #{search: '\s*^\s*'})
endfunction

"
" " ~"
function! s:tokens.RegisterBitNot()
    call s:Ruby.Register("bit_not", #{search: '\s*\%(<<\)\@<!\~'})
endfunction

"
" " << "
function! s:tokens.RegisterShiftLeft()
    call s:Ruby.Register("shift_left", #{search: '\s*\%(\<class\>\s\+\)\@<!<<\%([-~\U]\)\@!\s*'})
endfunction

"
" " >> "
function! s:tokens.RegisterShiftRight()
    call s:Ruby.Register("shift_right", #{search: '\s*>>\s*'})
endfunction
