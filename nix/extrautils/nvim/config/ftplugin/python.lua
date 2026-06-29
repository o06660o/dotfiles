vim.opt_local.shiftwidth = 4

require("conform").formatters_by_ft.python = { "black" }

if not vim.lsp.is_enabled("pyright") then
  vim.lsp.enable("pyright")
end
