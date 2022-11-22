return {
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

  -- disabled default plugins
  ["akinsho/bufferline.nvim"] = { disable = true },
  ["goolord/alpha-nvim"] = { disable = true },
  ["nvim-neo-tree/neo-tree.nvim"] = { disable = true },
  ["nvim-telescope/telescope.nvim"] = { disable = true },
  ["rebelot/heirline.nvim"] = { disable = true },
  ["stevearc/dressing.nvim"] = { disable = true },
  [("nvim-telescope/telescope-%s-native.nvim"):format(vim.fn.has "win32" == 1 and "fzy" or "fzf")] = { disable = true },
}
