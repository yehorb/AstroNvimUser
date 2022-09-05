local plugins = {
  ["akinsho/bufferline.nvim"] = { disable = true },
  ["feline-nvim/feline.nvim"] = { disable = true },
  ["goolord/alpha-nvim"] = { disable = true },
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
