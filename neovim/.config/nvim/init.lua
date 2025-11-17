local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)


require("lazy").setup({
  spec = {
    { "https://github.com/ramojus/mellifluous.nvim" },
    { "https://github.com/folke/which-key.nvim" },
    { "https://github.com/mason-org/mason.nvim" },
    {
      "mason-org/mason-lspconfig.nvim",
      opts = {},
      dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
      },
      ensure_installed = {
        "lua_ls", "pyright", "rust_analyzer", "jsonls", "bashls", "ruff", "marksman"
      },
    },
    {
      "https://github.com/nvim-treesitter/nvim-treesitter",
      modules = {},
      ensure_installed = {
        "lua", "python", "rust", "json", "markdown",
        "markdown_inline", "html", "yaml",
      },
      sync_install = false,
      ignore_install = {},
      auto_install = true,

    },
    { "https://github.com/nvim-lua/plenary.nvim" },
    { "https://github.com/nvim-telescope/telescope.nvim" },
    { "https://github.com/nvim-mini/mini.nvim" },
    { "https://github.com/MeanderingProgrammer/render-markdown.nvim" },
  },
  install = { colorscheme = { "habamax" } },
  checker = { enabled = true },
})

-- Colorscheme
vim.cmd.colorscheme("mellifluous")

-- LSP Configs
vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
      }
    }
  }
})

-- Basic Settings
vim.o.number = true
vim.o.relativenumber = true
vim.o.cursorline = true
vim.o.wrap = false
vim.o.scrolloff = 10
vim.o.sidescrolloff = 8
vim.o.gdefault = true
vim.o.swapfile = false
vim.o.wildmenu = true
vim.o.wildmode = "longest:full,full"
vim.o.mousescroll = "ver:3,hor:1"
vim.o.clipboard = "unnamedplus" -- Requires wl-clipboard

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

-- General Keybinds
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")
vim.keymap.set("x", "<", "<gv") -- indent left
vim.keymap.set("x", ">", ">gv") -- indent right
vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format, { desc = "LSP Format" })
vim.keymap.set('n', '<leader>e', ":Explore<CR>")

-- Editing
vim.keymap.set({ "n", "v" }, "<leader>d", '"_d', { desc = "Delete without yanking" })
vim.keymap.set("n", "Y", "y$", { desc = "Yank to end of line" })

-- Tabs
vim.o.showtabline = 1
vim.keymap.set('n', '<leader>tn', ':tabnew<CR>')
vim.keymap.set('n', '<leader>te', ':Texplore<CR>')
vim.keymap.set('n', '<leader>tc', ':tabclose<CR>')

-- Buffer
vim.o.hidden = true
vim.keymap.set("n", "<leader>bn", ":bnext<CR>")
vim.keymap.set("n", "<leader>bp", ":bprevious<CR>")
vim.keymap.set("n", "<leader>bd", ":bdelete<CR>")
vim.keymap.set("n", "<leader>bl", ":ls<CR>", { desc = "Buffer list" })

-- Splitting & Resizing
vim.keymap.set("n", "<leader>sv", ":vsplit<CR>")
vim.keymap.set("n", "<leader>sh", ":split<CR>")
vim.keymap.set("n", "<C-Up>", ":resize +2<CR>", { desc = "Increase window height" })
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>", { desc = "Decrease window height" })
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Decrease window width" })
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Increase window width" })

-- Better window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

-- Highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup,
  callback = function()
    vim.highlight.on_yank()
  end,
})
