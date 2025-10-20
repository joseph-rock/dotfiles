local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local configs = require("nvim-treesitter.configs")
      configs.setup({
        ensure_installed = {
          "bash", "comment", "css", "diff", "dockerfile", "html", "javascript",
          "json", "lua", "make", "markdown", "markdown_inline", "python",
          "rust", "sql", "toml", "tsx", "typescript", "vim", "xml", "yaml",
        },
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },
  -- {
  --   "neovim/nvim-lspconfig",
  --   dependencies = {
  --     "folke/lazydev.nvim",
  --     ft = "lua", -- only load on lua files
  --     opts = {
  --       library = {
  --         -- See the configuration section for more details
  --         -- Load luvit types when the `vim.uv` word is found
  --         { path = "${3rd}/luv/library", words = { "vim%.uv" } },
  --       },
  --     },
  --   },
  --   config = function()
  --     require("lspconfig").lua_ls.setup {}
  --     require("lspconfig").rust_analyzer.setup {}
  --   end,
  -- },
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  },
  {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup()
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
      vim.cmd [[Lazy load markdown-preview.nvim]]
      vim.fn["mkdp#util#install"]() 
    end,
  },
}, {
})

vim.opt.termguicolors = false
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.wrap = false
vim.opt.mousescroll = "ver:3,hor:1"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.gdefault = true
vim.opt.wildmode = "longest:full,full"
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.swapfile = false
vim.opt.list = true

vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")
vim.keymap.set("x", "<", "<gv") -- indent left
vim.keymap.set("x", ">", ">gv") -- indent right
