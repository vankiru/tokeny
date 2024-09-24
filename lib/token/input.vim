" CLASS: Input
"

let s:Input = {}
let g:Input = s:Input

function! s:Input.New(input)
    let input = copy(self)
    let input.variations = a:input

    return input
endfunction

function! s:Input.Insert(key, values)
    let variation = self.variations[a:key]
    let text = s:PrepareText(variation, a:values)

    call s:InsertInput(variation, text)
    call s:MoveCursor(variation, text)
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

    call s:InsertFirst(type, a:text[0])
    call append('.', a:text[1:])
endfunction

function! s:InsertFirst(type, text)
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
    call append('.', a:text)
    call cursor(line('.') + 1, 1)
endfunction

function! s:InsertText(text)
  let line = getline('.')
  let column = col('.')
  let text = line[:column - 1].a:text.line[column:]

  call setline('.', text)
endfunction

function! s:CharUnder()
    return nr2char(strgetchar(getline('.'), col('.') - 1))
endfunction

function! s:CharAfter()
    return nr2char(strgetchar(getline('.'), col('.')))
endfunction

" =============================================
"
function! s:MoveCursor(variation, text)
    let move = get(a:variation, 'move', 0)
    let column = col('.') + len(a:text[0]) - move

    call cursor('.', column)

    if s:CharUnder() == ' '
        call cursor('.', column - 1)
    endif
endfunction
