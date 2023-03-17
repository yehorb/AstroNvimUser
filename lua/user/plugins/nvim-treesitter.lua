return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    { "nvim-treesitter/nvim-treesitter-textobjects" },
    { "nvim-treesitter/playground" },
  },
  opts = function(_, opts)
    opts.ensure_installed = { "c", "lua", "vim", "help" }
    require("nvim-treesitter.install").prefer_git = false
  end,
}
