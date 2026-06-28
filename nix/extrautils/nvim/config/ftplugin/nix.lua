vim.treesitter.start()

require("conform").formatters_by_ft.nix = { "nixfmt" }

if not vim.lsp.is_enabled("nixd") then
  vim.lsp.enable("nixd")
end
