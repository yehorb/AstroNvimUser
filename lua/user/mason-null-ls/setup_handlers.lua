local null_ls = require "null-ls"

---is_in_cwd checks if the given filename is present in the current directory
---@param filename string | string[]
---@return boolean
local function is_in_cwd(filename)
  return #vim.fs.find(filename, { type = "file" }) > 0
end

return {
  mypy = function()
    local source = null_ls.builtins.diagnostics.mypy.with {
      extra_args = { "--python-executable", vim.fn.exepath "python" },
    }
    null_ls.register(source)
  end,
  selene = function()
    if is_in_cwd "selene.toml" then
      null_ls.register(null_ls.builtins.diagnostics.selene)
    end
  end,
  luacheck = function()
    if is_in_cwd ".luacheckrc" then
      null_ls.register(null_ls.builtins.diagnostics.luacheck)
    end
  end,
}
