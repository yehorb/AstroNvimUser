return {
  config = function()
    require "user.plugins.lsp-signature.config"
  end,
  after = { "nvim-lspconfig" },
}
