local path = require "mason-core.path"

local M = {}

M.UPDATE_PYTHON_IN_VENVS = string.format(
  [[
Get-ChildItem %s -Recurse -Directory `
  | Where-Object { $_.FullName -match "packages\\[^\\]+\\venv$" } `
  | ForEach-Object { python.exe -mvenv --upgrade $_.FullName }
]],
  path.package_prefix ""
)

return M
