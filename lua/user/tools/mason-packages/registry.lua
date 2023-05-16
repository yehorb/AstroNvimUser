---@type table<string, string>
local M = {}

local packages = {
  "broot",
  "github-cli",
  "lazygit",
  "ripgrep",
}

-- add custom package name to mason-registry
for _, package in ipairs(packages) do
  M[package] = string.format("user.tools.mason-packages.%s", package)
end

return M
