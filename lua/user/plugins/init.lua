local plugins = {
  ["NvChad/nvim-colorizer.lua"] = {  disable = true },
  ["akinsho/bufferline.nvim"] = { disable = true },
  ["feline-nvim/feline.nvim"] = { disable = true },
  ["folke/which-key.nvim"] = { commit = "9c190ea91939eba8c2d45660127e0403a5300b5a~1" },
  ["goolord/alpha-nvim"] = { disable = true },
  ["williamboman/mason-lspconfig.nvim"] = { disable = true },
  ["williamboman/mason.nvim"] = { disable = true },
  { "arcticicestudio/nord-vim" },
  { "tpope/vim-repeat" },
  {
    "tpope/vim-dadbod",
    config = function()
      astronvim.which_key_register {
        v = {
          ["<Leader>b"] = { name = "vim-dadbod." },
          ["<Leader>bb"] = { "<Cmd>DB<Enter>", "Execute the database query." },
        },
      }
    end,
    ft = "sql",
  },
  { "tpope/vim-surround" },
}

return plugins
