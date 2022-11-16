local Detect = require "user.platform.detect"
local Unix = require "user.platform.unix"
local Windows = require "user.platform.windows"

local Platform = {}

function Platform.setup(self)
  local detector = Detect.new()
  if detector.is_windows() then
    self.platform_ = Windows.new()
  else
    self.platform_ = Unix.new()
  end
  detector = nil
  return self
end

function Platform.platform(self)
  return self.platform_
end

function Platform.shell(self)
  return self:platform():shell()
end

function Platform.fileformat(self)
  return self:platform():fileformat()
end

return Platform:setup()
