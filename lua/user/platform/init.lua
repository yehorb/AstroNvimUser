local Platform = require "user.platform.core"

if Platform.is_win() then
  if os.getenv "NVIM_USE_CMD" == "1" then
    return require "user.platform.default"
  end
  return require "user.platform.win"
else
  return require "user.platform.default"
end
