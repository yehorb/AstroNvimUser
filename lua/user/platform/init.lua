local Detect = require "user.platform.detect"
local Unix = require "user.platform.unix"
local Windows = require "user.platform.windows"

local platform = {}
local detector_, platform_

function platform.setup()
  detector_ = Detect:new()
  if detector_:is_windows() then
    platform_ = Windows:new()
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
  return detector_:is_unix()
end

function platform.is_windows()
  return detector_:is_windows()
end

platform.setup()

return platform
