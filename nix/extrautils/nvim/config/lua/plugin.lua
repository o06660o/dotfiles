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

require("tokyonight").setup({
  on_highlights = function(hl, c)
    hl.Comment = { fg = c.fg_dark }
  end,
})
vim.cmd.colorscheme("tokyonight")
