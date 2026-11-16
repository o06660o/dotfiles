require("conform").formatters_by_ft[vim.bo.filetype] = { "clang-format" }

vim.lsp.config("clangd", {
  cmd = {
    "clangd",
    "--query-driver=" .. vim.fn.exepath("c++"),
  },
})

if not vim.lsp.is_enabled("clangd") then
  vim.lsp.enable("clangd")
end
