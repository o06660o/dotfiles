require("conform").formatters_by_ft[vim.bo.filetype] = { "prettier" }

if not vim.lsp.is_enabled("ts_ls") then
  vim.lsp.enable("ts_ls")
end
