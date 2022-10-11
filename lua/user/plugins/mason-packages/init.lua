local platform = require "user.platform"
if not platform.is_win() then
  return {}
end

local status_ok, index = pcall(require, "mason-registry.index")
if not status_ok then
  return {}
end

local packages = {
  "broot",
  "github-cli",
  "lazygit",
}

-- add custom package name to mason-registry
for _, package in ipairs(packages) do
  index[package] = string.format("user.plugins.mason-packages.%s", package)
end

return packages
