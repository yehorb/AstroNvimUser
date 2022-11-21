local Query = require "user.platform.query"
local Unix = require "user.platform.unix"
local Windows = require "user.platform.windows"

local platform = {}
local query_, platform_

function platform.setup()
  query_ = Query:new()
  if query_:is_windows() then
    local shell
    if os.getenv "NVIM_USE_CMD" == "1" then
      shell = require "user.platform.windows.shell.cmd"
    else
      shell = require "user.platform.windows.shell.powershell"
    end
    platform_ = Windows:new(shell)
  else
    platform_ = Unix:new()
  end
end

function platform.shell()
  return platform_:shell()
end

function platform.fileformat()
  return platform_:fileformat()
end

function platform.is_unix()
  return query_:is_unix()
end

function platform.is_windows()
  return query_:is_windows()
end

platform.setup()

return platform
