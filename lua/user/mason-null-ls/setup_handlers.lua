local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
  return {}
end

local setup = {
  mypy = function()
    local source = null_ls.builtins.diagnostics.mypy.with {
      extra_args = { "--python-executable", vim.fn.exepath "python" },
    }
    null_ls.register(source)
  end,
  selene = function()
    local source = null_ls.builtins.diagnostics.selene.with {
      extra_args = { "--config", string.format("%s/selene.toml", astronvim.install.config) },
    }
    null_ls.register(source)
  end,
}

return setup
