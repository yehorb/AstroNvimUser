local index = require "mason-registry.index"

-- add custom package name to mason-registry
index["broot"] = "user.plugins.mason-packages.broot"
index["github-cli"] = "user.plugins.mason-packages.github-cli"
index["lazygit"] = "user.plugins.mason-packages.lazygit"

local setup = {
  auto_update = false,
  ensure_installed = {
    "broot",
    "github-cli",
    "lazygit",
  },
  run_on_start = false,
}

return setup
