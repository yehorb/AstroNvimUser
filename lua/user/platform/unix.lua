local Unix = {}

function Unix.new(self)
  local state = {}
  self.__index = self
  setmetatable(state, self)
  return state
end

function Unix.shell()
  return {}
end

function Unix.fileformat()
  return {
    fileformat = "unix",
    fileformats = { "unix" },
  }
end

return Unix
