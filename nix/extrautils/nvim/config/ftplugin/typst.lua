require("conform").formatters_by_ft.typst = { "typstyle" }

if not vim.lsp.is_enabled("tinymist") then
  vim.lsp.enable("tinymist")
end
