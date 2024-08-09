" {name}
" {name} = {value}
" {name}:
" {name}: {value}
" *{name}
" **{name}
" &{name}
" *
" **
" &
" ...
"
" {arg}, 
" {arg})
" {arg}|
"
" m(arg, arg)
" m((arg, arg))
" m arg, arg

let s:atoms = g:Ruby.atoms

" type = "\%(*\|**\|&\)\="
" name = "\<{base_name}\>"
" default = "\s*=\s*{value}"
" keyward = ":\s*{value}\=" 
" suffix = "\%(,\s*\)\|)\||\)\@="
" suffix = "\%(,\s*\|\%()\||\)\@=\)"
" "{type}{name}\%({default}\|{keyward}\)\={suffix}"
" "\%(*\|**\|&\|\.\.\.\)"
function! s:atoms.RegisterArt()
    let context = self.BuildContext(#{name: "base_name", body: "value"})

    let l:type = '"\%(*\|**\|&\)\="'
    let default = '"\%(\%(\s*=\s*\|:\s*\)"'
    let suffix = '"\)\=\%(,\s*\|\%()\||\)\@=\)"'

    let regex = [
      \l:type . " . name . " . default . " . body . " . suffix,
      \"\%(*\|**\|&\|\.\.\.\)"
    \]

    self.Register("art", context, regex)
endfunction

"
" "({arg}*)"
" "(.*)"
function! s:atoms.RegisterArts()
    let context = #{anon: #{name: ".\+"}, ided: #{name: "id"}}

    self.Register("arts", context, '"(" . name . ".*)"')
endfunction

"
" "|{arg}*|"
" "|.*|"
function! s:atoms.RegisterBarbs()
    let context = #{anon: #{name: ".\+"}, ided: #{name: "id"}}

    self.Register("barbs", context, '"|" . name . ".*|"')
endfunction
