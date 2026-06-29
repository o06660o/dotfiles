require("conform").formatters_by_ft[vim.bo.filetype] = { "clang-format" }

if not vim.lsp.is_enabled("clangd") then
  vim.lsp.enable("clangd")
end
