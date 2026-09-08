{
  description = "My personal project templates";

  outputs = { self }: {
    templates.go = {
      path = ./go;
      description = "Go devshell: gopls, delve, golangci-lint";
    };
    templates.lean = {
      path = ./lean;
      description = "Lean 4 devshell: elan (lean, lake)";
    };
  };
}
