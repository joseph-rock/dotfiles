-- Plugins
vim.pack.add({
  { src = "https://github.com/ramojus/mellifluous.nvim" },
  { src = "https://github.com/neovim/nvim-lspconfig" },
  { src = "https://github.com/mason-org/mason.nvim" },
  { src = "https://github.com/mason-org/mason-lspconfig.nvim" },
})

-- LSP
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "lua_ls", "pyright", "rust_analyzer", "jsonls" }
})

vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
      }
    }
  }
})

-- Colorscheme
require("mellifluous").setup({})
vim.cmd.colorscheme("mellifluous")

-- Basic Settings
vim.o.number = true
vim.o.relativenumber = true
vim.o.cursorline = true
vim.o.wrap = false
vim.o.scrolloff = 10
vim.o.sidescrolloff = 8
vim.o.gdefault = true
vim.o.swapfile = false
vim.o.timeoutlen = 2000
vim.o.ttimeoutlen = 0
vim.o.wildmode = "longest:full,full"
vim.o.mousescroll = "ver:3,hor:1"

-- Indentation
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.autoindent = true

-- Search Settings
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = false
vim.o.incsearch = true

-- Visual Settings
vim.o.termguicolors = true
vim.o.signcolumn = "yes"
vim.o.colorcolumn = "100"
vim.o.showmatch = true
vim.o.matchtime = 2
vim.o.cmdheight = 1
vim.o.completeopt = "menuone,noinsert,noselect"
vim.o.synmaxcol = 300
vim.o.winborder = "rounded"
vim.o.list = true
vim.o.splitright = true
vim.o.splitbelow = true

-- Tab display settings
vim.opt.showtabline = 1
vim.opt.tabline = ''

-- General Keybinds
vim.g.mapleader = " "
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")
vim.keymap.set("x", "<", "<gv") -- indent left
vim.keymap.set("x", ">", ">gv") -- indent right
vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format)
vim.keymap.set('n', '<leader>e', ":Explore<CR>")
vim.keymap.set("n", "<leader>ff", ":find ")

-- Tabs
vim.keymap.set('n', '<leader>tn', ':tabnew<CR>')
vim.keymap.set('n', '<leader>te', ':Texplore<CR>')
vim.keymap.set('n', '<leader>tq', ':tabclose<CR>')
vim.keymap.set('n', '<leader>tm', ':tabmove<CR>')
vim.keymap.set('n', '<leader>t>', ':tabmove +1<CR>')
vim.keymap.set('n', '<leader>t<', ':tabmove -1<CR>')

-- Buffer
vim.o.hidden = false
vim.keymap.set("n", "<leader>bn", ":bnext<CR>")
vim.keymap.set("n", "<leader>bp", ":bprevious<CR>")
vim.keymap.set("n", "<leader>bq", ":bdelete<CR>")
