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
vim.keymap.set("n", "<Space>v", ":vertical terminal<CR>")

-- Autocmd
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.cmd("set formatoptions-=ro")
  end,
})

-- Builtin Terminal
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
vim.keymap.set("t", "<C-Esc>", function()
  vim.api.nvim_chan_send(vim.b.terminal_job_id, "\027")
end)
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
    if vim.w.terminal_view then
      vim.fn.winrestview(vim.w.terminal_view)
    end
    vim.cmd("startinsert")
  end,
})
vim.api.nvim_create_autocmd({ "TermLeave", "WinLeave" }, {
  pattern = "term://*",
  callback = function()
    vim.w.terminal_view = vim.fn.winsaveview()
  end,
})
local terminal_resize_pending = false
vim.api.nvim_create_autocmd({ "VimResized", "WinResized" }, {
  pattern = "*",
  callback = function()
    if terminal_resize_pending then
      return
    end
    terminal_resize_pending = true
    vim.schedule(function()
      terminal_resize_pending = false
      for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
        local buf = vim.api.nvim_win_is_valid(win) and vim.api.nvim_win_get_buf(win)
        if buf and vim.bo[buf].buftype == "terminal" then
          vim.api.nvim_win_call(win, function()
            vim.api.nvim_win_set_cursor(win, { vim.api.nvim_buf_line_count(buf), 0 })
            vim.w.terminal_view = vim.fn.winsaveview()
          end)
        end
      end
    end)
  end,
})

-- Builtin LSP Framework
vim.diagnostic.config({ signs = false })
vim.keymap.set("n", "<Space>d", function()
  vim.diagnostic.open_float()
end)

-- NOTE: We treat `.h` file as C header instead of C++ header.
vim.filetype.add({ extension = { h = "c" } })
