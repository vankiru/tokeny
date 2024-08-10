" Title:        vim-talon
" Description:  vim commands for editing code files through Talon
" Maintainer:   Julia Egorova <https://github.com/vankiru>

if exists("g:loaded_vimtalon")
  finish
endif
let g:loaded_vimtalon = 1

function! g:BuildRegex(list)
    let regex = reduce(a:list, { str, value -> str . ' . "\|" . ' .  value }, "")
    return '"\%(" .' . regex . ' . "\)"'
endfunction
