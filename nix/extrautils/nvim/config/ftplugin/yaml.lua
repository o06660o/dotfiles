require("conform").formatters_by_ft.yaml = { "yamlfmt" }

if not vim.lsp.is_enabled("yamlls") then
  vim.lsp.enable("yamlls")
end
