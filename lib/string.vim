"
function! g:InterpolateString(string)
    let pat = '{\(\w\+\%(\.\w\+\)\=\)}'
    let Sub = {match -> "'.".match[1].".'"}

    let result = substitute(a:string, pat, Sub, 'g')

    return "'".result."'"
endfunction
