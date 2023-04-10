local M = {}

---is_in_cwd checks if the given filename is present in the current directory
---@param filename string | string[]
---@return boolean
function M.is_in_cwd(filename)
  return #vim.fs.find(filename, { type = "file" }) > 0
end

return M
