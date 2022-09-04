local utils = {}

local is_windows = vim.loop.os_uname().version:match("Windows")

function utils.shell()
  if is_windows then
    return "pwsh.exe"
  end
  return nil
end

function utils.shellcmdflag()
  if is_windows then
    return "-NonInteractive -NoProfile -Command"
  end
  return nil
end

return utils
