local mason_tool_installer = require "mason-tool-installer"

mason_tool_installer.setup {
  ensure_installed = require "user.plugins.mason-packages",
  run_on_start = false,
}
