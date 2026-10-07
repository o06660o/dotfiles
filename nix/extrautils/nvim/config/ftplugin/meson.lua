local conform = require("conform")

conform.formatters.meson = {
  command = "meson",
  args = { "format", "--inplace", "$FILENAME" },
  stdin = false,
}
conform.formatters_by_ft.meson = { "meson" }

if not vim.lsp.is_enabled("mesonlsp") then
  vim.lsp.enable("mesonlsp")
end
