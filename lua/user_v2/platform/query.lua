local Query = {}
Query.__index = Query

function Query.new(platforms)
  local self = {}
  self.platforms = platforms or Query.platforms()
  return setmetatable(self, Query)
end

function Query.platforms()
  return {
    ["linux"] = vim.fn.has "linux",
    ["mac"] = vim.fn.has "mac",
    ["unix"] = vim.fn.has "unix",
    ["win"] = vim.fn.has "win32",
    ["win32"] = vim.fn.has "win32",
    ["win64"] = vim.fn.has "win64",
  }
end

function Query.is_unix(self)
  return (self.platforms.linux == 1 or self.platforms.mac == 1 or self.platforms.unix == 1)
end

function Query.is_windows(self)
  return (self.platforms.win == 1 or self.platforms.win32 == 1 or self.platforms.win64 == 1)
end

return Query
