local Detect = {}

function Detect.new(self, state)
  state = state or self.new_state()
  self.__index = self
  setmetatable(state, self)
  return state
end

function Detect.new_state()
  return {
    ["linux"] = vim.fn.has "linux",
    ["mac"] = vim.fn.has "mac",
    ["unix"] = vim.fn.has "unix",
    ["win"] = vim.fn.has "win32",
    ["win32"] = vim.fn.has "win32",
    ["win64"] = vim.fn.has "win64",
  }
end

function Detect.is_unix(self)
  return (self.linux == 1 or self.mac == 1 or self.unix == 1)
end

function Detect.is_windows(self)
  return (self.win == 1 or self.win32 == 1 or self.win64 == 1)
end

return Detect
