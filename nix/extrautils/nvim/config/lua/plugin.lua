require("blink.cmp").setup({
  keymap = { preset = "super-tab" },
  fuzzy = { frecency = { enabled = false } },
})

require("conform").setup({
  format_on_save = true,
  notify_on_error = true,
})

require("nvim-autopairs").setup({})
require("nvim-autopairs").remove_rule('"')
require("nvim-autopairs").remove_rule("'")
require("nvim-autopairs").remove_rule("`")

require("nvim-treesitter").setup({})
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function(args)
    if vim.treesitter.get_parser(args.buf, nil, { error = false }) then
      vim.treesitter.start(args.buf)
    end
  end,
})

require("tokyonight").setup({
  on_highlights = function(hl, c)
    hl.Comment = { fg = c.fg_dark }
  end,
})
vim.cmd.colorscheme("tokyonight")
