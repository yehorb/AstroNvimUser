local lsp_signature = require "lsp_signature"

lsp_signature.setup {
  bind = true,
  doc_lines = 0,
  hint_enable = false,
  handler_opts = {
    border = "shadow",
  },
  toggle_key = "<C-_>", -- Ctrl+/
}
