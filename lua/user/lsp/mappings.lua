return {
  n = {
    ["<C-]>"] = { vim.lsp.buf.definition, desc = "Show the definition of current symbol" },
    ["<Leader>lll"] = { vim.diagnostic.setloclist, desc = "Add buffer diagnostics to the location list." },
    ["<Leader>llq"] = { vim.diagnostic.setqflist, desc = "Add all diagnostics to the quickfix list." },
    ["gh"] = { vim.lsp.buf.hover, desc = "Hover symbol details" },
    ["gl"] = {
      function()
        vim.diagnostic.open_float {
          format = function(diagnostic)
            return string.format("%s: %s", diagnostic.code, diagnostic.message)
          end,
        }
      end,
      desc = "Hover diagnostics",
    },
    ["gT"] = false,
  },
  i = {
    ["<C-_>"] = { vim.lsp.buf.signature_help, desc = "Show signature help" },
  },
}
