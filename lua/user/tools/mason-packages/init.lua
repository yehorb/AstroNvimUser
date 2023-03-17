local index = require "mason-registry.index"

local packages = {
  "broot",
  "github-cli",
  "lazygit",
  "ripgrep",
}

-- add custom package name to mason-registry
for _, package in ipairs(packages) do
  index[package] = string.format("user.tools.mason-packages.%s", package)
end
