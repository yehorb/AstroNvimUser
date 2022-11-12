local Platform = {
  is = {
    ["linux"] = vim.fn.has "linux",
    ["mac"] = vim.fn.has "mac",
    ["unix"] = vim.fn.has "unix",
    ["win"] = vim.fn.has "win32",
    ["win32"] = vim.fn.has "win32",
    ["win64"] = vim.fn.has "win64",
  },
}

function Platform.is_unix()
  return (Platform.is.linux == 1 or Platform.is.mac == 1 or Platform.is.unix == 1)
end

function Platform.is_win()
  return (Platform.is.win == 1 or Platform.is.win32 == 1 or Platform.is.win64 == 1)
end

function Platform.new(self)
  return setmetatable({}, { __index = self })
end

return Platform
