return {
  after = "mason.nvim",
  config = function()
    require "user.plugins.mason-tool-installer.config"
  end,
}
