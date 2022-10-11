return {
  -- tpope
  {
    "tpope/vim-dadbod",
    setup = function()
      require "user.plugins.vim-dadbod"
    end,
    ft = "sql",
  },
  { "tpope/vim-repeat" },
  { "tpope/vim-surround" },
  { "tpope/vim-vinegar" },

  -- treesitter
  { "nvim-treesitter/nvim-treesitter-textobjects", after = "nvim-treesitter" },
  { "nvim-treesitter/playground", after = "nvim-treesitter" },

  { "arcticicestudio/nord-vim" },
  { "editorconfig/editorconfig-vim" },
}
