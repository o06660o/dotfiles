-- Options
vim.opt.clipboard = "unnamedplus"
vim.opt.expandtab = true
vim.opt.list = true
vim.opt.mouse = "a"
vim.opt.number = true
vim.opt.shiftround = true
vim.opt.shiftwidth = 2
vim.opt.softtabstop = -1
vim.opt.splitright = true
vim.opt.termguicolors = true
vim.opt.textwidth = 100
vim.opt.undofile = true
vim.opt.wrap = false

-- Keymap
vim.keymap.set("n", "<C-s>", ":w<CR>")
vim.keymap.set("n", "<C-LeftMouse>", "")

-- Autocmd
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.cmd("set formatoptions-=ro")
  end,
})

-- Builtin LSP Framework
vim.diagnostic.config({ signs = false })
vim.keymap.set("n", "<Space>d", function()
  vim.diagnostic.open_float()
end)

-- NOTE: We treat `.h` file as C header instead of C++ header.
vim.filetype.add({
  extension = {
    h = "c",
    mli = "ocamlinterface",
    mll = "ocamllex",
    mly = "menhir",
  },
})
