local Unix = {}

function Unix.new(self, state)
  state = state or {}
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
