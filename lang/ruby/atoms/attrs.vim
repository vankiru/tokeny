type = "\%(*\|**\|&\)\="
arg_name = "\<{base_name}\>"
default = "\s*=\s*{value}"
keyward = ":\s*{value}\="
suffix = "\%(,\s*\)\|)\||\)\@="

suffix = "\%(,\s*\|\%()\||\)\@=\)"

arg = "{type}{arg_name}\%({default}\|{keyward}\)\={suffix}"
arg = "\%(*\|**\|&\|\.\.\.\)"

let s:arg_atom = Atom.New()

s:arg_atom.parts = {
  "name": "</",
  "body": ""
}

s:atom.


call atoms.Regsiter("arg", "type . name . '\%(' . default . '\|' . keyward . '\)\=' . suffix")
call atoms.Regsiter("arg", "'\%(*\|**\|&\)\=' . name . '\%(' . default . '\|' . keyward . '\)\=' . suffix")
call atoms.Regsiter("arg", "\%(*\|**\|&\|\.\.\.\)")


atom_args = "({arg}*)"
atom_barbs = "|{arg}*|"

let s:type = "\%(*\|**\|&\)\="
default = "\s*=\s*{value}"
keyward = ":\s*{value}\="
suffix = "\%(,\s*\)\|)\||\)\@="

suffix = "\%(,\s*\|\%()\||\)\@=\)"

arg = "{type}{arg_name}\%({default}\|{keyward}\)\={suffix}"
arg = "\%(*\|**\|&\|\.\.\.\)"

# attr
function! s:atoms.RegisterAttr()
    let context = #{
        \anon: #{name: self.anon.base_name, body: self.anon.value },
        \ided: #{name: self.ided.base_name, body: self.anon.value }
    \}

    let regex = [
      \"\%(*\|**\|&\)\=" . ' . name . "\%(\%(\s*=\s*\|:\s*\)" . body . "\)\=' . "\%(,\s*\|\%()\||\)\@=\)",
      \"\%(*\|**\|&\|\.\.\.\)"
    \]

    self.anon.Register("attr", context, regex)
endfunction
