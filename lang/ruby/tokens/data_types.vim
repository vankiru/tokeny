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
    let select = #{token: 'snake_name'}

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
    let select = #{token: 'number'}

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
        \double: #{type: 'space', text: '"{value}"', move: 1},
        \quote: #{type: 'space', text: "'{value}'", move: 1},
        \grave: #{type: 'space', text: '`{value}`', move: 1},
        \percent: #{type: 'space', text: '%q[{value}]', move: 1},
        \heredoc: #{type: 'space', text: '<<~TEXT\n{value}\nTEXT'},
        \text: #{type: 'after', text: '{value}'}
    \}

    let search = #{
        \body: '{tags.text}',
    \}
        "\token: s:StringRegex()

    let select = #{body: 'i.string', token: 'a.string'}

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

    let general = '%['.a:prefix.']\('.delimiter.'\){body}\1'
    let paren = '%['.a:prefix.']({body})'
    let bracket = '%['.a:prefix.']{{body}}'
    let square = '%['.a:prefix.']\[{body}\]'
    let tag = '%['.a:prefix.']<{body}>'

    return '\%('.general.'\|'.paren.'\|'.paren.'\|'.bracket.'\|'.square.'\|'.tag.'\)'
endfunction

"
":{id}\w*
function! g:Ruby.tokens.RegisterSymbol()
    let input = #{
        \base: #{type: 'space', text: ':{value}'},
        \double: #{type: 'space', text: ':"{value}"'},
        \quote: #{type: 'space', text: ":'{value}'"},
        \percent: #{type: 'space', text: "%s[{value}]"}
    \}

    let search = #{
        \body: '{tags.text}',
    \}
        "\token: s:SymbolRegex()

    let select = #{
        \body: 'snake_name',
        \token: 'snake_name'
    \}

    call g:Ruby.Register('symbol', input, search, select)
endfunction

function! s:SymbolRegex()
  let base = ':{body}\<\w*\>'
  let quote = ':''{body}[\\]\@<!'''
  let double = ':"{body}[\\]\@<!"'
  let percent = s:PercentRegex('s')

  return '\%('.base.'\|'.quote.'\|'.double.'\|'.percent.'\)'
endfunction

"
" \/{id}.*\/
function! g:Ruby.tokens.RegisterRegex()
    let input = #{
        \base: #{type: 'space', text: '/{value}/', move: 1},
        \object: #{type: 'space', text: 'Regex.new()', move: 1}
    \}

    let search = #{
        \body: '{tags.text}',
        \token: s:RegexRegex()
    \}

    let select = #{
        \body: 'i.regex',
        \token: 'a.regex'
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
    let input = #{
        \base: #{type: 'space', text: '[]', move: 1},
        \sim: #{type: 'space', text: '%i[]', move: 1},
        \string: #{type: 'space', text: '%w[]', move: 1},
        \object: #{type: 'space', text: 'Array.new()', move: 1}
    \}

    let search = #{
        \body: '{tags.exp}',
    \}
        "\token: s:ArrayRegex()

    let select = #{
        \body: 'i.array',
        \token: 'a.array'
    \}

    call g:Ruby.Register('array', input, search, select)
endfunction

function! s:ArrayRegex()
    let prefix = '\%(\w\|[]})?!\"'']\)\@<!'
    let array = prefix.'\[{body}'
    let percent = s:PercentRegex('wWiI')
    let object = 'Array.new{base.arts}'

    return '\%('.array.'\|'.percent.'\)'
endfunction

"
" \(#\|-> \|\w\+\((.*)\)\? \)\@<!\({$\|{{id}.*}\)
" Hash\.new(.*)
function! g:Ruby.tokens.RegisterHash()
    let input = #{
        \base: #{type: 'space', text: '{}', move: 1},
        \object: #{type: 'space', text: 'Hash.new()', move: 1}
    \}

    let search = #{
        \body: '{tags.exp}',
        \token: s:HashRegex()
    \}

    let select = #{
        \body: 'i.hash',
        \token: 'a.hash'
    \}

    call g:Ruby.Register('hash', input, search, select)
endfunction

function! s:HashRegex()
    let prefix = '\%(->\s*\|{base.method_name}\|)\s*\|%[qQiIwWsr]\|#\)\@<!'
    let hash = prefix.'{{body}}'
    let object = 'Hash.new{base.arts}'

    return '\%('.hash.'\|'.object.'\)'
endfunction

"
" Set\.new(.*)
function! g:Ruby.tokens.RegisterSet()
    let input = #{
        \base: #{type: 'space', text: 'Set.new()', move: 1},
    \}

    let search = #{
        \body: '{tags.exp}',
        \token: 'Set\.new({body}'
    \}

    let select = #{
        \body: '',
        \token: ''
    \}

    call g:Ruby.Register('set', input, search, select)
endfunction

"
" -> {.*}
"  proc { }
function! g:Ruby.tokens.RegisterLambda()
    let input = #{
        \lambda: #{type: 'space', text: '-> { }', move: 1},
        \proc: #{type: 'space', text: 'proc { }', move: 1},
    \}

    let search = #{
        \body: '{tags.exp}',
        \token: s:LambdaRegex()
    \}

    let select = #{
        \body: 'i.hash',
        \token: ''
    \}

    call g:Ruby.Register('lambda', input, search, select)
endfunction

function! s:LambdaRegex()
    let lambda = '->\s*{base.arts}\s*{{body}'
    let proc = 'proc\s*{\s*{base.barbs}{body}'

    return '\%('.lambda.'\|'.proc.'\)'
endfunction

"
" ({id}\d*..)
" (\.\.{id}\d*)
" (\.\.{id}\d*)
" (\.\.\.{id}\d*)
function! g:Ruby.tokens.RegisterRange()
    let input = #{
        \full_by: #{type: 'space', text: '({values[0]}..{values[1]})'},
        \full_until: #{type: 'space', text: '({values[0]}...{values[1]})'},
        \left_by: #{type: 'space', text: '({value}..)'},
        \left_until: #{type: 'space', text: '({value}...)'},
        \right_by: #{type: 'space', text: '(..{value})'},
        \right_until: #{type: 'space', text: '(...{value})'}
    \}

    let search = #{
        \body: s:RangeBodyRegex(),
        \token: s:RangeRegex()
    \}

    let select = #{
        \body: 'i.arts',
        \token: 'a.arts'
    \}

    call g:Ruby.Register('range', input, search, select)
endfunction

function! s:RangeBodyRegex()
    let full = '({tags.number}\.\.\.\={base.number})'
    let left = '({tags.number}\.\.\.\=)'
    let right = '(\.\.\.\={tags.number})'

    return '\%('.full.'\|'.left.'\|'.right.'\)'
endfunction

function! s:RangeRegex()
    let range = '({body})'
    let object = 'Range.new{base.arts}'

    return '\%('.range.'\|'.object.'\)'
endfunction

"
" #{{{id}.\{-}}}
function! g:Ruby.tokens.RegisterInterpolation()
    let input = #{
        \base: #{type: 'after', text: '#{{value}}'},
        \empty: #{type: 'after', text: '#{}', move: 1}
    \}

    let search = #{
        \body: '{tags.exp}',
        \token: '#{{body}'
    \}

    let select = #{
        \body: 'i.hash',
        \token: ''
    \}

    call g:Ruby.Register('interpolation', input, search, select)
endfunction

"
" {{id}}\w*: \({VALUE_REGEX}, \ze\|{VALUE_REGEX\ze[}|]\)
" "{{id}}\w*": \({VALUE_REGEX}, \ze\|{VALUE_REGEX\ze[}|]\)
" {{id}}\w* => \({VALUE_REGEX}, \ze\|{VALUE_REGEX\ze[}|]\)
function! g:Ruby.tokens.RegisterKey()
    let input = #{
        \symbol: #{type: 'space', text: '{value}:'},
        \string: #{type: 'space', text: '"{value}":'},
        \object: #{type: 'space', text: '{value} =>'},
        \emtpy: #{type: 'after', text: ':'}
    \}

    let search = #{
        \name: '\%({tags.snake_name\|"{tags.exp}"\)',
        \body: '{base.exp}',
        \token: '{name}\s*\%(:\|=>\)\s*{body}'
    \}

    let select = #{
        \name: 'snake_name',
        \body: '',
        \token: ''
    \}

    call g:Ruby.Register('key', input, search, select)
endfunction
