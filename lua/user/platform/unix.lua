local Unix = {}

function Unix.new(self)
  local unix = {}
  self.__index = self
  setmetatable(unix, self)
  return unix
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

function Unix.home()
  return os.getenv "HOME"
end

return Unix
