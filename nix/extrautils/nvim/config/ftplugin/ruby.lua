require("conform").formatters_by_ft.ruby = { "rubocop" }

if not vim.lsp.is_enabled("solargraph") then
  vim.lsp.enable("solargraph")
end
