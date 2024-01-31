return {
  {
    "arcticicestudio/nord-vim",
    enabled = false,
    lazy = false,
    priority = 1000,
    config = function(_, _)
      vim.cmd.colorscheme "nord"
    end,
  },
}
