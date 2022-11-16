local Windows = {}

function Windows.new(self, state)
  state = state or self.new_state()
  self.__index = self
  setmetatable(state, self)
  return state
end

function Windows.new_state()
  if os.getenv "NVIM_USE_CMD" == "1" then
    return { shell = require "platform.windows.shell.cmd" }
  end
  return { shell = require "platform.windows.shell.powershell" }
end

function Windows.shell(self)
  return self.shell
end

function Windows.fileformat()
  return {
    fileformat = "unix",
    fileformats = { "unix", "dos" },
  }
end

return Windows
