return {
  n = {
    ["<C-]>"] = {
      function()
        vim.lsp.buf.definition()
      end,
      desc = "Show the definition of current symbol",
    },
    ["gh"] = {
      function()
        vim.lsp.buf.hover()
      end,
      desc = "Hover symbol details",
    },
  },
}
