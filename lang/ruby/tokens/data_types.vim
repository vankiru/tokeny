" VALUE_REGEX = "\([[:alnum:]_\"',\. @$\[\]{}()]\+\|:\w\+\)"

"
"true": "\<true\>[?!]\@!",
function! s:tokens.RegisterTrue()
    call s:Ruby.Register("true", #{search: '\<true\>'})
endfunction

"
"false": "\<false\>[?!]\@!",
function! s:tokens.RegisterFalse()
    call s:Ruby.Register("false", #{search: '\<false\>'})
endfunction

"
"nil": "\<nil\>[?!]\@!",
function! s:tokens.RegisterNil()
    call s:Ruby.Register("nil", #{search: '\<nil\>'})
endfunction

" "number": {
"     "search_regex": "{id}\d*"
" },
function! s:tokens.RegisterNumber()
    let regex = #{
        \search: ''
    \}

    call s:Ruby.Register("number", regex)
endfunction

"
" "string": {
"     "search_regex": '"{id}.*"'
" },
function! s:tokens.RegisterString()
      let regex = #{
          \search: ''
      \}

      call s:Ruby.Register("string", regex)
endfunction

"
" "sim": {
"     "search_regex": ":{id}\w*"
" },
function! s:tokens.RegisterSim()
      let regex = #{
          \search: ''
      \}

      call s:Ruby.Register("sim", regex)
endfunction

"
" "rig": {
"     "search_regex": "\/{id}.*\/
" }"
function! s:tokens.RegisterRegex()
      let regex = #{
          \search: ''
      \}

      call s:Ruby.Register("regex", regex)
endfunction

"
" "list": {
"     "search_regex": "\(\w\+\)\@<!\([$\|\[{id}.*\]\)"
"     "search_regex": "Array\.new(.*)"
" },
function! s:tokens.RegisterArray()
      let regex = #{
          \search: ''
      \}

      call s:Ruby.Register("array", regex)
endfunction

"
" "hash": {
"     "search_regex": "\(#\|-> \|\w\+\((.*)\)\? \)\@<!\({$\|{{id}.*}\)"
"     "search_regex": "Hash\.new(.*)"
" },
function! s:tokens.RegisterHash()
      let regex = #{
          \search: ''
      \}

      call s:Ruby.Register("hash", regex)
endfunction

"
" "set": {
"     "search_regex": "Set\.new(.*)"
" },
function! s:tokens.RegisterSet()
      let regex = #{
          \search: ''
      \}

      call s:Ruby.Register("set", regex)
endfunction

"
" "lambda": {
"     "search_regex": "-> {.*}"
" },
function! s:tokens.RegisterLambda()
      let regex = #{
          \search: ''
      \}

      call s:Ruby.Register("lambda", regex)
endfunction

"
" "range": {
"     "search_regex": "({id}\d*..)"
"     "search_regex": "(\.\.{id}\d*)"
"     "search_regex": "(\.\.{id}\d*)"
"     "search_regex": "(\.\.\.{id}\d*)"
" },
function! s:tokens.RegisterRange()
      let regex = #{
          \search: ''
      \}

      call s:Ruby.Register("", regex)
endfunction

"
" "interpol": {
"     "type": "inline",
"     "id_type": "snake_case",
"     "search_regex": "#{{{id}.\{-}}}"
" },
function! s:tokens.RegisterInterpolation()
      let regex = #{
          \search: ''
      \}

      call s:Ruby.Register("interpolation", regex)
endfunction

"
" "key": {
"     "search_regex": f"{{id}}\w*: \({VALUE_REGEX}, \ze\|{VALUE_REGEX\ze[}|]\)",
"     "search_regex": f'"{{id}}\w*": \({VALUE_REGEX}, \ze\|{VALUE_REGEX\ze[}|]\)',
"     "search_regex": f"{{id}}\w* => \({VALUE_REGEX}, \ze\|{VALUE_REGEX\ze[}|]\)",
" }
function! s:tokens.RegisterKey()
    let regex = #{
      \search: ''
      \}

      call s:Ruby.Register("key", regex)
endfunction

"
" "item": {
" }
function! s:tokens.RegisterItem()
    let regex = #{
      \search: ''
      \}

      call s:Ruby.Register("item", regex)
endfunction
