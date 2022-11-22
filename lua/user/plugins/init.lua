local disable = require "user.plugins.disable"

local plugins = {
  -- tpope
  ["tpope/vim-dadbod"] = require "user.plugins.vim-dadbod.plugin",
  { "tpope/vim-repeat" },
  { "tpope/vim-surround" },
  { "tpope/vim-vinegar" },

  -- treesitter
  { "nvim-treesitter/nvim-treesitter-textobjects", after = "nvim-treesitter" },
  { "nvim-treesitter/playground", after = "nvim-treesitter" },

  ["folke/neodev.nvim"] = require "user.plugins.neodev.plugin",
  { "arcticicestudio/nord-vim" },
  { "editorconfig/editorconfig-vim" },
}

return vim.tbl_extend("error", plugins, disable)
