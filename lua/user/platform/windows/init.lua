local Windows = {}

function Windows.new(self, shell)
  shell = shell or require "user.platform.windows.shell.cmd"
  local windows = { shell_ = shell }
  self.__index = self
  setmetatable(windows, self)
  return windows
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
