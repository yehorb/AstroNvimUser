local settings = {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "astronvim", "vim" },
      },
      runtime = {
        version = "LuaJIT",
      },
    },
  },
}

return settings
