-- Options
vim.opt.autochdir = true
vim.opt.clipboard = "unnamedplus"
vim.opt.expandtab = true
vim.opt.list = true
vim.opt.mouse = "a"
vim.opt.number = true
vim.opt.shiftround = true
vim.opt.shiftwidth = 2
vim.opt.softtabstop = -1
vim.opt.splitright = true
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

-- Builtin Terminal
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
vim.keymap.set("t", "<C-w>h", "<C-\\><C-n><C-w>h")
vim.keymap.set("t", "<C-w>j", "<C-\\><C-n><C-w>j")
vim.keymap.set("t", "<C-w>k", "<C-\\><C-n><C-w>k")
vim.keymap.set("t", "<C-w>l", "<C-\\><C-n><C-w>l")
vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "*",
  callback = function()
    vim.opt_local.number = false
  end,
})
vim.api.nvim_create_autocmd({ "TermOpen", "WinEnter" }, {
  pattern = "term://*",
  callback = function()
    vim.cmd("startinsert")
  end,
})

-- Builtin LSP Framework
vim.diagnostic.config({ signs = false })
vim.keymap.set("n", "<Space>d", function()
  vim.diagnostic.open_float()
end)

-- NOTE: We treat `.h` file as C header instead of C++ header.
vim.filetype.add({ extension = { h = "c" } })
