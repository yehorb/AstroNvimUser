local disable = require "user.plugins.disable"

local plugins = {
  -- tpope
  ["tpope/vim-dadbod"] = require "user.plugins.vim-dadbod.plugin",
  { "tpope/vim-fugitive" },
  { "tpope/vim-repeat" },
  { "tpope/vim-surround" },
  { "tpope/vim-vinegar" },

  -- treesitter
  { "nvim-treesitter/nvim-treesitter-textobjects", after = "nvim-treesitter" },
  { "nvim-treesitter/playground", after = "nvim-treesitter" },

  -- lsp
  ["ray-x/lsp_signature.nvim"] = require "user.plugins.lsp-signature.plugin",

  ["folke/neodev.nvim"] = require "user.plugins.neodev.plugin",
  ["j-hui/fidget.nvim"] = require "user.plugins.fidget.plugin",
  ["simrat39/rust-tools.nvim"] = require "user.plugins.rust-tools.plugin",
  { "arcticicestudio/nord-vim" },
  { "editorconfig/editorconfig-vim" },

  -- local
  ["C:\\Users\\yehorb\\projects\\nvim\\broot.nvim"] = require "user.plugins.broot.plugin",
}

return vim.tbl_extend("error", plugins, disable)
