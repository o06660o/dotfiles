require("conform").formatters_by_ft.cmake = { "cmake_format" }

if not vim.lsp.is_enabled("cmake") then
  vim.lsp.enable("cmake")
end
