local Windows = {}
Windows.__index = Windows

function Windows.new(shell)
  local self = {}
  self.shell_ = shell or require "user.platform.windows.shell.cmd"
  return setmetatable(self, Windows)
end

function Windows.shell(self)
  return self.shell_
end

function Windows.fileformat()
  return {
    fileformat = "unix",
    fileformats = { "unix", "dos" },
  }
end

function Windows.home()
  return os.getenv "USERPROFILE"
end

return Windows
