require("conform").formatters_by_ft.lua = { "stylua" }

if not vim.lsp.is_enabled("lua_ls") then
  vim.lsp.enable("lua_ls")
end
