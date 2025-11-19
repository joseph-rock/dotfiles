return {
  "https://github.com/nvim-treesitter/nvim-treesitter",
  opts = {
    build = ":TSUpdate",
    modules = {},
    ensure_installed = {
      "lua", "python", "rust", "json", "markdown",
      "markdown_inline", "html", "yaml", "html", "latex", "yaml",
    },
    sync_install = false,
    ignore_install = {},
    auto_install = true,
  }
}
