return {
  { "editorconfig/editorconfig-vim", event = "User AstroFile" },
  {
    "numToStr/Comment.nvim",
    keys = {
      {
        "g/",
        function()
          require("Comment.api").toggle.linewise.count(vim.v.count > 0 and vim.v.count or 1)
        end,
        mode = { "n" },
        desc = "Comment line",
      },
      {
        "g/",
        "<Esc><Cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
        mode = { "v" },
        desc = "Comment selected lines",
      },
    },
  },
  { "tpope/vim-fugitive", event = "User AstroGitFile" },
  { "tpope/vim-repeat", event = "User AstroFile" },
  { "tpope/vim-surround", event = "User AstroFile" },
}
