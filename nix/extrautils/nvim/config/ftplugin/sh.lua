require("conform").formatters_by_ft[vim.bo.filetype] = { "shfmt" }

if not vim.lsp.is_enabled("bashls") then
  vim.lsp.enable("bashls")
end
