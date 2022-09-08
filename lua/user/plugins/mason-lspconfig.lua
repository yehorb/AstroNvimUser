local mason_lspconfig = {
  automatic_installation = false,
  ensure_installed = {
    "pyright",
    "sumneko_lua",
    "terraformls",
  },
}

return mason_lspconfig
