require("blink.cmp").setup({
  keymap = { preset = "super-tab" },
  fuzzy = { frecency = { enabled = false } },
})

require("conform").setup({
  format_on_save = true,
  notify_on_error = true,
})

require("gitsigns").setup({})

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
require("nvim-tree").setup({
  on_attach = function(bufnr)
    local api = require("nvim-tree.api")
    local function opts(desc)
      return {
        desc = "nvim-tree: " .. desc,
        buffer = bufnr,
        noremap = true,
        silent = true,
        nowait = true,
      }
    end

    api.map.on_attach.default(bufnr)
    vim.keymap.set("n", ".", api.filter.dotfiles.toggle, opts("Toggle Filter: Dotfiles"))
    vim.keymap.set("n", "h", api.node.navigate.parent_close, opts("Close Directory"))
    vim.keymap.set("n", "l", function()
      local node = api.tree.get_node_under_cursor()
      if node and node.open == false then
        api.node.open.edit(node)
      end
    end, opts("Open Directory"))
    vim.keymap.set("n", "s", api.tree.search_node, opts("Search"))
    vim.keymap.set({ "n", "x" }, "d", api.fs.trash, opts("Trash"))
    vim.keymap.set({ "n", "x" }, "D", api.fs.remove, opts("Delete"))
    vim.keymap.set({ "n", "x" }, "y", api.fs.copy.node, opts("Copy"))
    vim.keymap.set({ "n", "x" }, "c", api.fs.copy.filename, opts("Copy Name"))
    vim.keymap.set({ "n", "x" }, "C", api.fs.copy.absolute_path, opts("Copy Absolute Path"))
  end,
  filters = { dotfiles = true },
  actions = { open_file = { quit_on_open = true } },
  ui = { confirm = { default_yes = true } },
})
vim.keymap.set("n", "<Space>a", ":NvimTreeToggle<CR>")

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
