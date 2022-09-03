local function shell()
  local is_windows = vim.loop.os_uname().sysname == "Windows_NT"
  if is_windows then
    return "pwsh.exe"
  end
  return nil
end

local function termguicolors()
  if vim.fn.has "termguicolors" then
    return true
  end
  return nil
end

local options = {
  opt = {
    fileencoding = "utf-8",
    fileformat = "unix",
    fileformats = { "unix", "dos" },
    linebreak = true,
    list = true,
    listchars = { eol = "¶", tab = "→·", trail = "·", nbsp = "+" },
    shell = shell(),
    showbreak = "> ",
    termguicolors = termguicolors(),
  },
  g = {
    mapleader = "\\",
  },
}

return options
