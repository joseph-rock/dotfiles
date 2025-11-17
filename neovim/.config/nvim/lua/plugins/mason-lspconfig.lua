return {
  "mason-org/mason-lspconfig.nvim",
  opts = {},
  dependencies = {
    { "mason-org/mason.nvim", opts = {} },
    "neovim/nvim-lspconfig",
  },
  ensure_installed = {
    "lua_ls", "pyright", "rust_analyzer", "jsonls", "bashls", "ruff", "marksman"
  },
}
