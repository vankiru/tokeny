" CLASS: Input
"

let s:Input = {}
let g:Input = s:Input

function! s:Input.New(variations)
    let input = copy(self)
    let input.variations = a:variations

    return input
endfunction

function! s:Input.Insert(key, values)
    let variation = self.variations[a:key]

    let text = s:PrepareText(variation, a:values)
    let line = getline('.')

    call s:InsertInput(variation, text)
    call s:MoveCursor(variation, text, line)
endfunction

" =============================================
"
function! s:PrepareText(variation, values)
    let text = g:InterpolateString(a:variation.text)

    let values = a:values
    let value = get(values, 0, '')

    execute('let text = '.text)

    return split(text, '\\n')
endfunction

" =============================================
"
function! s:InsertInput(variation, text)
    let type = a:variation.type

    call s:InsertFirstLine(type, a:text[0])
    call s:InsertOtherLines(a:text)
endfunction

function! s:InsertFirstLine(type, text)
    if a:type == 'space'
        call s:InsertSpace(a:text)
    elseif a:type == 'after'
        call s:InsertAfter(a:text)
    elseif a:type == 'below'
        call s:InsertBelow(a:text)
    endif
endfunction

function! s:InsertSpace(text)
    let text = a:text

    if '({[: ' !~ s:CharUnder()
        let text = ' '.text
    endif

    if ')}]:, ' !~ s:CharAfter()
        let text = text.' '
    endif

    call s:InsertText(text)
endfunction

function! s:InsertAfter(text)
    call s:InsertText(a:text)
endfunction

function! s:InsertBelow(text)
    execute 'normal! o '

    let spaces = repeat(' ', col('.') - 1)
    call setline('.', spaces.a:text)
endfunction

function! s:InsertOtherLines(text)
    let spaces = repeat(' ', col('.') - 1)
    let lines = map(a:text[1:], {_, line -> spaces.line})

    call append('.', lines)
endfunction

function! s:InsertText(text)
  let line = getline('.')
  let column = col('.')
  let text = line[:column - 1].a:text.line[column:]

  call setline('.', text)
endfunction

" =============================================
"
function! s:MoveCursor(variation, text, line)
    let move = get(a:variation, 'move', 0)
    let column = col('.')  + len(a:text[0]) - move

    if empty(a:line)
        let column -= 1
    endif

    if s:CharUnder() == ' ' || s:CharAfter() == ' '
        let column += 1
    endif

    call cursor('.', column)
endfunction

" =============================================
"
function! s:CharUnder()
    return s:CharAt(col('.') - 1)
endfunction

function! s:CharAfter()
    return s:CharAt(col('.'))
endfunction

function! s:CharAt(column)
    return nr2char(strgetchar(getline('.'), a:column))
endfunction
