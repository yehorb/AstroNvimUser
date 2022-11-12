local Platform = require "user.platform.core"

local Default = Platform:new()

function Default.shell()
  return {}
end

function Default.fileformat()
  return {
    fileformat = "unix",
    fileformats = { "unix" },
  }
end

return Default
