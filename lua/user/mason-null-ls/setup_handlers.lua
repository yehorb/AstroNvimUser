local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
  return {}
end

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
    if not is_in_cwd "selene.toml" then
      return nil
    end
    null_ls.register(null_ls.builtins.diagnostics.selene)
  end,
  luacheck = function()
    if not is_in_cwd ".luacheckrc" then
      return nil
    end
    null_ls.register(null_ls.builtins.diagnostics.luacheck)
  end,
}
