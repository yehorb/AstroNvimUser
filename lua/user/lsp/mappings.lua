return {
  n = {
    ["<C-]>"] = { vim.lsp.buf.definition, desc = "Show the definition of current symbol" },
    ["gh"] = { vim.lsp.buf.hover, desc = "Hover symbol details" },
  },
  i = {
    ["<C-_>"] = { vim.lsp.buf.signature_help, desc = "Show signature help" },
  },
}
