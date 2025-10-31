-- Vim Config
vim.o.termguicolors = false
vim.o.number = true
vim.o.relativenumber = true
vim.o.expandtab = true
vim.o.shiftwidth = 2
vim.o.signcolumn = "yes"
vim.o.wrap = false
vim.o.mousescroll = "ver:3,hor:1"
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.gdefault = true
vim.o.wildmode = "longest:full,full"
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.swapfile = false
vim.o.list = true

-- Plugins
vim.pack.add({
  { src = "https://github.com/stevearc/oil.nvim" },
  { src = "https://github.com/echasnovski/mini.pick" },
  { src = "https://github.com/neovim/nvim-lspconfig" },
  { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
})

require "mini.pick".setup()
require "oil".setup()
require "nvim-treesitter".setup({
  ensure_installed = {
    "bash", "comment", "css", "diff", "dockerfile", "html", "javascript",
    "json", "lua", "make", "markdown", "markdown_inline", "python",
    "rust", "sql", "toml", "tsx", "typescript", "vim", "xml", "yaml",
  },
  highlight = { enable = true },
  indent = { enable = true },
})

-- General Keybinds
vim.g.mapleader = " "
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")
vim.keymap.set("x", "<", "<gv") -- indent left
vim.keymap.set("x", ">", ">gv") -- indent right
vim.keymap.set('n', '<leader>o', ':update<CR> :source<CR>')
vim.keymap.set('n', '<leader>w', ':write<CR>')
vim.keymap.set('n', '<leader>q', ':quit<CR>')

-- Plugin Keybinds
vim.keymap.set('n', '<leader>f', ":Pick files<CR>")
vim.keymap.set('n', '<leader>h', ":Pick help<CR>")

vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format)

vim.keymap.set('n', '<leader>e', ":Oil<CR>")

-- LSP
vim.lsp.enable({ "lua_ls", "rust_analyzer" })

vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
      }
    }
  }
})
