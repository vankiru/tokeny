" "set to": {
"     "search_regex": " = "
" },
function! s:tokens.RegisterSetTo()
    let regex = #{
        \search: ''
    \}

    call s:Ruby.Register("set_to", regex)
endfunction

"
" "plus": {
"     "search_regex": " + "
" },
function! s:tokens.RegisterPlus()
    let regex = #{
        \search: ''
    \}

    call s:Ruby.Register("plus", regex)
endfunction

"
" "minus": {
"     "search_regex": " - "
" },
function! s:tokens.RegisterMinus()
    let regex = #{
        \search: ''
    \}

    call s:Ruby.Register("minus", regex)
endfunction

"
" "multi": {
"     "search_regex": " \* "
" },
function! s:tokens.RegisterMulti()
    let regex = #{
        \search: ''
    \}

    call s:Ruby.Register("multi", regex)
endfunction

"
" "divide": {
"     "search_regex": " \/ "
" },
function! s:tokens.RegisterDivide()
    let regex = #{
        \search: ''
    \}

    call s:Ruby.Register("divide", regex)
endfunction

"
" "modulus": {
"     "search_regex": " % "
" },
function! s:tokens.RegisterModulus()
    let regex = #{
        \search: ''
    \}

    call s:Ruby.Register("modulus", regex)
endfunction

"
" "power": {
"     "search_regex": "\*\*"
" },
function! s:tokens.RegisterPower()
    let regex = #{
        \search: ''
    \}

    call s:Ruby.Register("power", regex)
endfunction

"
" "plus equal": {
"     "search_regex": " += "
" },
function! s:tokens.RegisterPlusEqual()
    let regex = #{
        \search: ''
    \}

    call s:Ruby.Register("plus_equal", regex)
endfunction

"
" "minus equal": {
"     "search_regex": " -= "
" },
function! s:tokens.RegisterMinusEqual()
    let regex = #{
        \search: ''
    \}

    call s:Ruby.Register("minus_equal", regex)
endfunction

"
" "multi equal": {
"     "search_regex": " \*= "
" },
function! s:tokens.RegisterMultiEqual()
    let regex = #{
        \search: ''
    \}

    call s:Ruby.Register("multi_equal", regex)
endfunction

"
" "divide equal": {
"     "search_regex": " \/= "
" },
function! s:tokens.RegisterDivideEqual()
    let regex = #{
        \search: ''
    \}

    call s:Ruby.Register("divide_equal", regex)
endfunction

"
" "mod equal": {
"     "search_regex": " %= "
" },
function! s:tokens.RegisterModEqual()
    let regex = #{
        \search: ''
    \}

    call s:Ruby.Register("mod_equal", regex)
endfunction

"
" "power equal": {
"     "search_regex": " \*\*= "
" },
function! s:tokens.RegisterPowerEqual()
    let regex = #{
        \search: ''
    \}

    call s:Ruby.Register("power_equal", regex)
endfunction

"
" "equal": {
"     "search_regex": " == "
" },
function! s:tokens.RegisterEqual()
    let regex = #{
        \search: ''
    \}

    call s:Ruby.Register("equal", regex)
endfunction

"
" "not equal": {
"     "search_regex": " != "
" },
function! s:tokens.RegisterNotEqual()
    let regex = #{
        \search: ''
    \}

    call s:Ruby.Register("not_equal", regex)
endfunction

"
" "great": {
"     "search_regex": " > "
" },
function! s:tokens.RegisterGreat()
    let regex = #{
        \search: ''
    \}

    call s:Ruby.Register("great", regex)
endfunction

"
" "less": {
"     "search_regex": " < "
" },
function! s:tokens.RegisterLess()
    let regex = #{
        \search: ''
    \}

    call s:Ruby.Register("less", regex)
endfunction

"
" "great equal": {
"     "search_regex": " >= "
" },
function! s:tokens.RegisterGreatEqual()
    let regex = #{
        \search: ''
    \}

    call s:Ruby.Register("great_equal", regex)
endfunction

"
" "less equal": {
"     "search_regex": " <= "
" },
function! s:tokens.RegisterLessEqual()
    let regex = #{
        \search: ''
    \}

    call s:Ruby.Register("less_equal", regex)
endfunction

"
" "compare": {
"     "search_regex": " <=> "
" },
function! s:tokens.RegisterCompare()
    let regex = #{
        \search: ''
    \}

    call s:Ruby.Register("compare", regex)
endfunction

"
" "test equal": {
"     "search_regex": " === "
" },
function! s:tokens.RegisterTestEqual()
    let regex = #{
        \search: ''
    \}

    call s:Ruby.Register("test_equal", regex)
endfunction

"
" "add | also": {
"     "search_regex": " && "
" },
function! s:tokens.RegisterAnd()
    let regex = #{
        \search: ''
    \}

    call s:Ruby.Register("and", regex)
endfunction

"
" "or | either": {
"     "search_regex": " || "
" },
function! s:tokens.RegisterOr()
    let regex = #{
        \search: ''
    \}

    call s:Ruby.Register("or", regex)
endfunction

"
" "not": {
"     "search_regex": " !"
" },
function! s:tokens.RegisterNot()
    let regex = #{
        \search: ''
    \}

    call s:Ruby.Register("not", regex)
endfunction

"
" "text add | also": {
"     "search_regex": " and "
" },
function! s:tokens.RegisterTextAnd()
    let regex = #{
        \search: ''
    \}

    call s:Ruby.Register("text_and", regex)
endfunction

"
" "text or | either": {
"     "search_regex": " or "
" },
function! s:tokens.RegisterTextOr()
    let regex = #{
        \search: ''
    \}

    call s:Ruby.Register("text_or", regex)
endfunction

"
" "text not": {
"     "search_regex": " not "
" },
function! s:tokens.RegisterTextNot()
    let regex = #{
        \search: ''
    \}

    call s:Ruby.Register("text_not", regex)
endfunction

"
" "index": {
"     "search_regex": "\w\+\zs\[.*\]"
" },
function! s:tokens.RegisterIndex()
    let regex = #{
        \search: ''
    \}

    call s:Ruby.Register("index", regex)
endfunction

"
" "inside": {
"     "search_regex": " in "
" },
function! s:tokens.RegisterIn()
    let regex = #{
        \search: ''
    \}

    call s:Ruby.Register("in", regex)
endfunction

"
" "match": {
"     "search_regex": " => "
" },
function! s:tokens.RegisterMatch()
    let regex = #{
        \search: ''
    \}

    call s:Ruby.Register("match", regex)
endfunction

"
" "bit and": {
"     "search_regex": " & "
" },
function! s:tokens.RegisterBitAnd()
    let regex = #{
        \search: ''
    \}

    call s:Ruby.Register("bit_and", regex)
endfunction

"
" "bit or": {
"     "search_regex": " | "
" },
function! s:tokens.RegisterBitOr()
    let regex = #{
        \search: ''
    \}

    call s:Ruby.Register("bit_or", regex)
endfunction

"
" "bit ex": {
"     "search_regex": " ^ "
" },
function! s:tokens.RegisterBitEx()
    let regex = #{
        \search: ''
    \}

    call s:Ruby.Register("bit_ex", regex)
endfunction

"
" "bit not": {
"     "search_regex": " ~ "
" },
function! s:tokens.RegisterBitNot()
    let regex = #{
        \search: ''
    \}

    call s:Ruby.Register("bit_not", regex)
endfunction

"
" "bit left": {
"     "search_regex": " << "
" },
function! s:tokens.RegisterShiftLeft()
    let regex = #{
        \search: ''
    \}

    call s:Ruby.Register("shift_left", regex)
endfunction

"
" "bit right": {
"     "search_regex": " >> "
" },
function! s:tokens.RegisterShiftRight()
    let regex = #{
        \search: ''
    \}

    call s:Ruby.Register("shift_right", regex)
endfunction
