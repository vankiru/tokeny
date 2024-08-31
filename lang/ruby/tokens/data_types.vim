function! g:Ruby.tokens.RegisterDataTypes()
endfunction

" VALUE_REGEX = "\([[:alnum:]_\"',\. @$\[\]{}()]\+\|:\w\+\)"

"
"true": "\<true\>[?!]\@!",
function! g:Ruby.tokens.RegisterTrue()
    call g:Ruby.Register("true", #{search: '\<true\>'})
endfunction

"
"false": "\<false\>[?!]\@!",
function! g:Ruby.tokens.RegisterFalse()
    call g:Ruby.Register("false", #{search: '\<false\>'})
endfunction

"
"nil": "\<nil\>[?!]\@!",
function! g:Ruby.tokens.RegisterNil()
    call g:Ruby.Register("nil", #{search: '\<nil\>'})
endfunction

" "{id}\d*"
function! g:Ruby.tokens.RegisterNumber()
    let regex = #{
        \search: ''
    \}

    call g:Ruby.Register("number", regex)
endfunction

"
" "string": {
"     "search_regex": '"{id}.*"'
" },
function! g:Ruby.tokens.RegisterString()
      let regex = #{
          \search: ''
      \}

      call g:Ruby.Register("string", regex)
endfunction

"
" "sim": {
"     "search_regex": ":{id}\w*"
" },
function! g:Ruby.tokens.RegisterSim()
      let regex = #{
          \search: ''
      \}

      call g:Ruby.Register("sim", regex)
endfunction

"
" "rig": {
"     "search_regex": "\/{id}.*\/
" }"
function! g:Ruby.tokens.RegisterRegex()
      let regex = #{
          \search: ''
      \}

      call g:Ruby.Register("regex", regex)
endfunction

"
" "list": {
"     "search_regex": "\(\w\+\)\@<!\([$\|\[{id}.*\]\)"
"     "search_regex": "Array\.new(.*)"
" },
function! g:Ruby.tokens.RegisterArray()
      let regex = #{
          \search: ''
      \}

      call g:Ruby.Register("array", regex)
endfunction

"
" "hash": {
"     "search_regex": "\(#\|-> \|\w\+\((.*)\)\? \)\@<!\({$\|{{id}.*}\)"
"     "search_regex": "Hash\.new(.*)"
" },
function! g:Ruby.tokens.RegisterHash()
      let regex = #{
          \search: ''
      \}

      call g:Ruby.Register("hash", regex)
endfunction

"
" "set": {
"     "search_regex": "Set\.new(.*)"
" },
function! g:Ruby.tokens.RegisterSet()
      let regex = #{
          \search: ''
      \}

      call g:Ruby.Register("set", regex)
endfunction

"
" "lambda": {
"     "search_regex": "-> {.*}"
" },
function! g:Ruby.tokens.RegisterLambda()
      let regex = #{
          \search: ''
      \}

      call g:Ruby.Register("lambda", regex)
endfunction

"
" "range": {
"     "search_regex": "({id}\d*..)"
"     "search_regex": "(\.\.{id}\d*)"
"     "search_regex": "(\.\.{id}\d*)"
"     "search_regex": "(\.\.\.{id}\d*)"
" },
function! g:Ruby.tokens.RegisterRange()
      let regex = #{
          \search: ''
      \}

      call g:Ruby.Register("", regex)
endfunction

"
" "interpol": {
"     "type": "inline",
"     "id_type": "snake_case",
"     "search_regex": "#{{{id}.\{-}}}"
" },
function! g:Ruby.tokens.RegisterInterpolation()
      let regex = #{
          \search: ''
      \}

      call g:Ruby.Register("interpolation", regex)
endfunction

"
" "key": {
"     "search_regex": f"{{id}}\w*: \({VALUE_REGEX}, \ze\|{VALUE_REGEX\ze[}|]\)",
"     "search_regex": f'"{{id}}\w*": \({VALUE_REGEX}, \ze\|{VALUE_REGEX\ze[}|]\)',
"     "search_regex": f"{{id}}\w* => \({VALUE_REGEX}, \ze\|{VALUE_REGEX\ze[}|]\)",
" }
function! g:Ruby.tokens.RegisterKey()
    let regex = #{
      \search: ''
      \}

      call g:Ruby.Register("key", regex)
endfunction

"
" "item": {
" }
function! g:Ruby.tokens.RegisterItem()
    let regex = #{
      \search: ''
      \}

      call g:Ruby.Register("item", regex)
endfunction
