local index = require "mason-registry.index"

-- add custom package name to mason-registry
index["lazygit"] = "user.plugins.mason-packages.lazygit"
index["github-cli"] = "user.plugins.mason-packages.github-cli"

local mason_tool_installer = {
  auto_update = false,
  ensure_installed = {
    "github-cli",
    "lazygit",
    "stylua",
  },
  run_on_start = false,
}

return mason_tool_installer
