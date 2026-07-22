require("conform").formatters_by_ft.ocaml = { "ocamlformat" }

if not vim.lsp.is_enabled("ocamllsp") then
  vim.lsp.enable("ocamllsp")
end
