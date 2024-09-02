"
" \w\+\zs\[.*\]
function! g:Ruby.tokens.RegisterIndex()
    let regex = #{token: '\%(\w\|[\])}!?]\)\@<=['}
    let select = #{token: 'a{'}

    call g:Ruby.Register('index', regex, select)
endfunction

"
function! g:Ruby.tokens.RegisterOperator(name, regex)
    call g:Ruby.Register(a:name, #{token: a:regex}, #{token: ''})
endfunction

"
function! g:Ruby.tokens.RegisterOperators()
    " []
    call self.RegisterIndex()
    "  = 
    call g:Ruby.tokens.RegisterOperator('set_to', '\s*\%([<=]\)\@<!=\%([=>]\)\@!\s*')
    "  + 
    call g:Ruby.tokens.RegisterOperator('plus', '\s*+\%(=\)\@!\s*')
    "  - 
    call g:Ruby.tokens.RegisterOperator('minus', '\s*-\%([=>]\)\@!\s*')
    "  \* 
    call g:Ruby.tokens.RegisterOperator('multi', '\%(\w\|[)}\]?!]\)\@<=\s\*\s*\%(\w\)\@=')
    "  \/ 
    call g:Ruby.tokens.RegisterOperator('divide', '\s*\/\s*')
    "  % 
    call g:Ruby.tokens.RegisterOperator('mod', '\s*%\%(=\|[wWiIqsr]\W\)\@!\s*')
    " \*\*
    call g:Ruby.tokens.RegisterOperator('power', '\%(\w\|[)}\]?!]\)\@<=\s*\*\*\s*\%(\w\)\@=')
    "  += 
    call g:Ruby.tokens.RegisterOperator('plus_equal', '\s*+=\s*')
    "  -= 
    call g:Ruby.tokens.RegisterOperator('minus_equal', '\s*-=\s*')
    "  \*= 
    call g:Ruby.tokens.RegisterOperator('multi_equal', '\s*\*=\s*')
    "  \/= 
    call g:Ruby.tokens.RegisterOperator('divide_equal', '\s*\/=\s*')
    "  %= 
    call g:Ruby.tokens.RegisterOperator('mod_equal', '\s*%=\s*')
    "  \*\*= 
    call g:Ruby.tokens.RegisterOperator('power_equal', '\s*\*\*=\s*')
    "  == 
    call g:Ruby.tokens.RegisterOperator('equal', '\s*\%([=]\)\@<!==\%([=]\)\@!\s*')
    "  != 
    call g:Ruby.tokens.RegisterOperator('not_equal', '\s*!=\s*')
    "  > 
    call g:Ruby.tokens.RegisterOperator('great', '\s*\%([=->]\)\@<!>\%(>\)\@!\s*')
    "  < 
    call g:Ruby.tokens.RegisterOperator('less', '\s*\%(<\)\@<!<\%([<=]\)\@!\s*')
    "  >= 
    call g:Ruby.tokens.RegisterOperator('great_equal', '\s*>=\s*')
    "  <= 
    call g:Ruby.tokens.RegisterOperator('less_equal', '\s*<=\%(>\)\@!\s*')
    "  <=> 
    call g:Ruby.tokens.RegisterOperator('compare', '\s*<=>\s*')
    "  === 
    call g:Ruby.tokens.RegisterOperator('test_equal', '\s*===\s*')
    "  &&/and 
    call g:Ruby.tokens.RegisterOperator('and', '\%(\s*&&\s*\|\s\+\<and\>\s\+\)')
    "  ||/or 
    call g:Ruby.tokens.RegisterOperator('or', '\%(\s*||\s*\|\s\+\<or\>\s\+\)')
    "  !/not 
    call g:Ruby.tokens.RegisterOperator('not', '\%(^\|\s\+\)\%(!\|not\s\+\)')
    "  in 
    call g:Ruby.tokens.RegisterOperator('in', '\s\+\<in\>\s\+')
    "  => 
    call g:Ruby.tokens.RegisterOperator('match', '\s*\%(<\)\@<!=>\s*')
    "  & 
    call g:Ruby.tokens.RegisterOperator('bit_and', '\s*\%(&\)\@<!&\%([&\.]\|\h\)\@!\s*')
    "  | 
    call g:Ruby.tokens.RegisterOperator('bit_or', '\s*\%(|\)\@<!|\%(|\)\@!\s*')
    "  ^ 
    call g:Ruby.tokens.RegisterOperator('bit_xor', '\s*^\s*')
    "  ~
    call g:Ruby.tokens.RegisterOperator('bit_not', '\s*\%(<<\)\@<!\~')
    "  << 
    call g:Ruby.tokens.RegisterOperator('shift_left', '\s*\%(\<class\>\s\+\)\@<!<<\%([-~\U]\)\@!\s*')
    "  >> 
    call g:Ruby.tokens.RegisterOperator('shift_right', '\s*>>\s*')
endfunction
