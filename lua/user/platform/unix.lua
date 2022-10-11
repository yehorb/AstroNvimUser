local Platform = require "user.platform.core"

local Unix = Platform:new()

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
