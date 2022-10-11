local Platform = require "user.platform.core"

if Platform.is_unix() then
  return require "user.platform.unix"
elseif Platform.is_win() then
  return require "user.platform.win"
end
