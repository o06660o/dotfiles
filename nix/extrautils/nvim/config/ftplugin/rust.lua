vim.opt_local.shiftwidth = 4

require("conform").formatters_by_ft.rust = { "rustfmt" }

if not vim.lsp.is_enabled("rust_analyzer") then
  vim.lsp.enable("rust_analyzer")
end
