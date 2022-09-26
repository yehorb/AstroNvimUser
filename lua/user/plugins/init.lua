local plugins = {
  -- disable
  ["akinsho/bufferline.nvim"] = { disable = true },
  ["feline-nvim/feline.nvim"] = { disable = true },
  ["goolord/alpha-nvim"] = { disable = true },
  ["nvim-neo-tree/neo-tree.nvim"] = { disable = true },

  -- local
  {
    string.format("%s/%s", vim.fn.expand "$HOME", "Projects/nvim/nvim-treesitter"),
    as = "nvim-treesitter",
    run = ":TSUpdate",
    event = { "BufRead", "BufNewFile" },
    cmd = {
      "TSInstall",
      "TSInstallInfo",
      "TSInstallSync",
      "TSUninstall",
      "TSUpdate",
      "TSUpdateSync",
      "TSDisableAll",
      "TSEnableAll",
    },
    config = function()
      require "configs.treesitter"
    end,
  },

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

return function(default)
  default["nvim-treesitter/nvim-treesitter"] = nil
  return vim.tbl_deep_extend("force", default, plugins)
end
