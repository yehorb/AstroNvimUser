local cmp = {
  sources = {
    {
      name = "buffer",
      option = {
        get_bufnrs = vim.api.nvim_list_bufs,
      },
    },
  },
}

return cmp
