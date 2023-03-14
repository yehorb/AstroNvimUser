return {
  config = function()
    require "user.plugins.rust-tools.config"
  end,
  after = { "nvim-lspconfig" },
  ft = { "rust" },
}
