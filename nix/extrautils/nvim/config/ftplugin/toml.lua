require("conform").formatters_by_ft.toml = { "taplo" }

if not vim.lsp.is_enabled("taplo") then
  vim.lsp.enable("taplo")
end
