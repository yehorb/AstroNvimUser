require "user.plugins.mason-packages.lazygit"

local mason_tool_installer = {
  ensure_installed = {
    "lazygit",
    "stylua",
  },
  run_on_start = false,
}

return mason_tool_installer
