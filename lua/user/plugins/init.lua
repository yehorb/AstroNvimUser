return {
  -- tpope
  ["tpope/vim-dadbod"] = require "user.plugins.vim-dadbod",
  { "tpope/vim-repeat" },
  { "tpope/vim-surround" },
  { "tpope/vim-vinegar" },

  -- treesitter
  { "nvim-treesitter/nvim-treesitter-textobjects", after = "nvim-treesitter" },
  { "nvim-treesitter/playground", after = "nvim-treesitter" },

  ["WhoIsSethDaniel/mason-tool-installer.nvim"] = require "user.plugins.mason-tool-installer",
  { "arcticicestudio/nord-vim" },
  { "editorconfig/editorconfig-vim" },
}
