return { 
  'nvim-mini/mini.nvim', 
  version = false,
  config = function()
     require("mini.icons").setup({})
     require("mini.surround").setup({})
     -- require("mini.files").setup({})
     require("mini.tabline").setup({})
   end
}
