local Platform = require "user.platform.core"

local Windows = Platform:new()

function Windows.shell()
  return {
    shell = vim.fn.executable "pwsh" and "pwsh" or "powershell",
    shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;",
    shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait",
    shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode",
    shellquote = "",
    shellxquote = "",
  }
end

function Windows.fileformat()
  return {
    fileformat = "unix",
    fileformats = { "unix", "dos" },
  }
end

return Windows
