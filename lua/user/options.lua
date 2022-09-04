local utils = require "user.utils"

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
    shell = utils.shell(),
    shellcmdflag = utils.shellcmdflag(),
    showbreak = "> ",
    termguicolors = termguicolors(),
  },
  g = {
    mapleader = "\\",
  },
}

return options
