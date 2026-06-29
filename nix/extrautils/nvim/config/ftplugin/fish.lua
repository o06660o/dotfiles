vim.opt_local.shiftwidth = 4

require("conform").formatters_by_ft.fish = { "fish_indent" }

if not vim.lsp.is_enabled("fish_lsp") then
  vim.lsp.enable("fish_lsp")
end
