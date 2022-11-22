local Query = require "user.platform.query"
local Unix = require "user.platform.unix"
local Windows = require "user.platform.windows"

local M = {}
local query_, platform_

function M.setup()
  query_ = Query.new()
  if query_:is_windows() then
    local shell
    if os.getenv "NVIM_USE_CMD" == "1" then
      shell = require "user.platform.windows.shell.cmd"
    else
      shell = require "user.platform.windows.shell.powershell"
    end
    platform_ = Windows.new(shell)
  else
    platform_ = Unix.new()
  end
end

function M.shell()
  return platform_:shell()
end

function M.fileformat()
  return platform_:fileformat()
end

function M.is_unix()
  return query_:is_unix()
end

function M.is_windows()
  return query_:is_windows()
end

function M.home()
  return platform_:home()
end

M.setup()

return M
