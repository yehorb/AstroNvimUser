local plugins = {
  -- disable
  ["akinsho/bufferline.nvim"] = { disable = true },
  ["feline-nvim/feline.nvim"] = { disable = true },
  ["goolord/alpha-nvim"] = { disable = true },
  ["nvim-neo-tree/neo-tree.nvim"] = { disable = true },

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
  { "nvim-treesitter/nvim-treesitter-textobjects" },
  { "nvim-treesitter/playground" },

  { "arcticicestudio/nord-vim" },
  { "editorconfig/editorconfig-vim" },
}

return plugins
