 "\%({snake_name}\|{const_name}\|{class_name}\)"
"function! s:atoms.RegisterName()
    "for atom in ["snake_name", "const_name", "class_name"]
      "execute("let " . atom . " = self." . atom . ".params.name")
    "endfor

    "let snake_name = self.snake_name.params.name
    "let const_name = self.const_name.params.name
    "let class_name = self.class_name.params.name

    "let params = #{
        "\name: "\%(" . self.snake_name . "\|" . self.const_name . "\|" . self.class_name "\)",
        "\name: "\%(" . self.snake_name.params.name . "\|" . self.const_name.params.name . "\|" . self.class_name.params.name "\)",
        "\name: '"\%(" . names.snake_name . "\|" . names.const_name . "\|" . names.class_name "\)"',
        "\name: self.BuildParam("name", '"\%(" . snake_name . "\|" . const_name . "\|" . class_name "\)"')
      
        "\search: "name"
    "\}

    "call s:Ruby.RegisterAtom("snake_name", params)
"endfunction
