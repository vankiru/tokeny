"
function! g:Ruby.tokens.RegisterDataTypes()
    call g:Ruby.tokens.RegisterBool('true')
    call g:Ruby.tokens.RegisterBool('false')
    call g:Ruby.tokens.RegisterBool('nil')

    call g:Ruby.tokens.RegisterNumber()
    call g:Ruby.tokens.RegisterString()
    call g:Ruby.tokens.RegisterSymbol()
    call g:Ruby.tokens.RegisterRegex()
    call g:Ruby.tokens.RegisterArray()
    call g:Ruby.tokens.RegisterHash()
    call g:Ruby.tokens.RegisterSet()
    call g:Ruby.tokens.RegisterLambda()
    call g:Ruby.tokens.RegisterRange()
    call g:Ruby.tokens.RegisterInterpolation()
    call g:Ruby.tokens.RegisterKey()
    call g:Ruby.tokens.RegisterItem()
endfunction

"
" \<true\>[?!]\@!
" \<false\>[?!]\@!
" \<nil\>[?!]\@!
function! g:Ruby.tokens.RegisterBool(type)
    let input = #{
        \base: #{type: 'space', text: a:type}
    \}

    let search = #{token: '\<'.a:type.'\>[?!]\@!'}
    let select = #{token: 'e'}

    call g:Ruby.Register(a:type, input, search, select)
endfunction

" {id}\d*
function! g:Ruby.tokens.RegisterNumber()
    let input = #{
        \positive: #{type: 'space', text: '{value}'},
        \negative: #{type: 'space', text: '-{value}'},
        \exponent: #{type: 'space', text: 'e{value}'},
        \hexadecimal: #{type: 'space', text: '0x{value}'},
        \octal: #{type: 'space', text: '0o{value}'},
        \binary: #{type: 'space', text: '0b{value}'},
    \}

    let search = #{token: s:NumberRegex()}
    let select = #{token: ''}

    call g:Ruby.Register('number', input, search, select)
endfunction

function! s:NumberRegex()
    let minus = '-\='
    let prefix = '\%(0[dD]\)\='
    let digits = '\d\+\%(_\d\+\)*'
    let exponent = '\%([eE][-+]\='.digits.'\)\='
    let suffix = 'r\=i\='

    let decimal = minus.'\<'.prefix.digits.'\%(\.'.digits.'\)\='.exponent.suffix.'\>'
    let hexadecimal = minus.'\<0[xX]\x\+\%(_\x\+\)*'.suffix.'\>'
    let octal = minus.'\<0[oO]\=\o\+\%(_\o\+\)*'.suffix.'\>'
    let binary = minus.'\<0[bB][01]\+\%(_[01]\+\)*'.suffix.'\>'

    return '\%('.decimal.'\|'.hexadecimal.'\|'.octal.'\|'.binary.'\)'
endfunction

"
" {id}.*
function! g:Ruby.tokens.RegisterString()
    let input = #{
        \double: #{type: 'space', text: '"{value}"', move: 'h'},
        \quote: #{type: 'space', text: "'{value}'", move: 'h'},
        \grave: #{type: 'space', text: '`{value}`', move: 'h'},
        \percent: #{type: 'space', text: '%q[{value}]', move: 'h'},
        \heredoc: #{type: 'space', text: '<<~TEXT\n{value}\nTEXT', move: 'k$'}
    \}

    let search = #{
        \body: '{tags.text}',
        \token: s:StringRegex()
    }

    let select = #{body: '', token: ''}

    call g:Ruby.Register('string', input, search, select)
endfunction

function! s:StringRegex()
    let quote = '[\\]\@<!''{body}[\\]\@<!'''
    let double = '[\\]\@<!"{body}[\\]\@<!"'
    let grave = '[\\]\@<!`{body}[\\]\@<!`'

    let heredoc = '\(<<[-~]\?\(\w\+\)\)\n{body}\n\2'
    let percent = s:PercentRegex('qQ')

    return '\%('.quote.'\|'.double.'\|'.grave.'\|'.heredoc.'\|'.percent.'\)'
endfunction

function! s:PercentRegex(prefix)
    let delimiter = '[^[:alnum:][:space:]]'

    let general = '%['.a:prefix.']\({delimiter}\){body}\1'
    let paren = '%['.a:prefix.']({body})'
    let bracket = '%['.a:prefix.']{{{body}}}'
    let square = '%['.a:prefix.']\[{body}\]'
    let tag = '%['.a:prefix.']<{body}>'

    return '\%('.general.'\|'.paren.'\|'.paren.'\|'.bracket.'\|'.square.'\|'.tag.'\)'
endfunction

"
":{id}\w*
function! g:Ruby.tokens.RegisterSymbol()
    let input: #{
        \base: #{type: 'space', text: ':{value}'},
        \double: #{type: 'space', text: ':"{value}"'},
        \quote: #{type: 'space', text: ":'{value}'"},
        \percent: #{type: 'space', text: "%s[{value}]"}
    \}

    let search = #{
        \body: '{tags.text}',
        \token: s:SymbolRegex()
    \}

    let select = #{
        \body: '',
        \token: ''
    \}

    call g:Ruby.Register('symbol', input, search, select)
endfunction

function! s:SymbolRegex()
  let standard = ':{body}\<\w*\>'
  let quote = ':''{body}[\\]\@<!'''
  let double = ':"{body}[\\]\@<!"'
  let percent = s:PercentRegex('s')

  return '\%('.base.'\|'.quote.'\|'.double.'\|'.percent.'\)'
endfunction

"
" \/{id}.*\/
function! g:Ruby.tokens.RegisterRegex()
    let input: #{
        \base: #{type: 'space', text: '/{value}/', move: 'h'},
    \}

    let search = #{
        \body: '{tags.text}',
        \token: s:RegexRegex()
    \}

    let select = #{
        \body: '',
        \token: ''
    \}

    call g:Ruby.Register('regex', input, search, select)
endfunction

function! s:RegexRegex()
    let suffix = '\/[iomxneus]*'
    let prefix1 = '\%(\%(^\|\<\%(and\|or\|while\|until\|unless\|if\|elsif\|when\|not\|then\|else\)\|[;\~=!|&(,{[<>?:*+-]\)\s*\)\@<=/'
    let prefix2 = '\%(\w\+\s\+\)\@<=/\%(=\|\_s\)\@!'

    let regex1 = prefix1.'{body}'.suffix
    let regex2 = prefix2.'{body}'.suffix
    let percent = s:PercentRegex('r')

    return '\%('.regex1.'\|'.regex2.'\|'.percent.'\)'
endfunction
"
" \(\w\+\)\@<!\([$\|\[{id}.*\]\)
" Array\.new(.*)
function! g:Ruby.tokens.RegisterArray()
      let search = #{
          \token: ''
      \}

      call g:Ruby.Register('array', input, search, select)
endfunction

"
" \(#\|-> \|\w\+\((.*)\)\? \)\@<!\({$\|{{id}.*}\)
" Hash\.new(.*)
function! g:Ruby.tokens.RegisterHash()
      let search = #{
          \token: ''
      \}

      call g:Ruby.Register('hash', input, search, select)
endfunction

"
" Set\.new(.*)
function! g:Ruby.tokens.RegisterSet()
      let search = #{
          \token: ''
      \}

      call g:Ruby.Register('set', input, search, select)
endfunction

"
" -> {.*}
function! g:Ruby.tokens.RegisterLambda()
      let search = #{
          \token: ''
      \}

      call g:Ruby.Register('lambda', input, search, select)
endfunction

"
" ({id}\d*..)
" (\.\.{id}\d*)
" (\.\.{id}\d*)
" (\.\.\.{id}\d*)
function! g:Ruby.tokens.RegisterRange()
      let search = #{
          \token: ''
      \}

      call g:Ruby.Register('', input, search, select)
endfunction

"
" #{{{id}.\{-}}}
function! g:Ruby.tokens.RegisterInterpolation()
      let search = #{
          \token: ''
      \}

      call g:Ruby.Register('interpolation', input, search, select)
endfunction

"
" {{id}}\w*: \({VALUE_REGEX}, \ze\|{VALUE_REGEX\ze[}|]\)
" "{{id}}\w*": \({VALUE_REGEX}, \ze\|{VALUE_REGEX\ze[}|]\)
" {{id}}\w* => \({VALUE_REGEX}, \ze\|{VALUE_REGEX\ze[}|]\)
function! g:Ruby.tokens.RegisterKey()
    let search = #{
      \token: ''
      \}

      call g:Ruby.Register('key', input, search, select)
endfunction

"
function! g:Ruby.tokens.RegisterItem()
    let search = #{
        \token: ''
      \}

      call g:Ruby.Register('item', input, search, select)
endfunction
