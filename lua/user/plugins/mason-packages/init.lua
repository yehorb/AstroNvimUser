local platform = require "user.platform"
if not platform.is_windows() then
  return {}
end

local index = require "mason-registry.index"

local packages = {
  "broot",
  "github-cli",
  "lazygit",
  "luacheck",
}

-- add custom package name to mason-registry
for _, package in ipairs(packages) do
  index[package] = string.format("user.plugins.mason-packages.%s", package)
end

return packages
