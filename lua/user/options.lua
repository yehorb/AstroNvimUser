local utils = require "user.utils"

local function termguicolors()
  if vim.fn.has "termguicolors" then
    return true
  end
  return nil
end

local options = {
  opt = vim.tbl_extend("force", {
    fileencoding = "utf-8",
    fileformat = "unix",
    fileformats = { "unix", "dos" },
    linebreak = true,
    list = true,
    listchars = { eol = "¶", tab = "→·", trail = "·", nbsp = "+" },
    showbreak = "> ",
    termguicolors = termguicolors(),
  }, utils.shell()),
  g = {
    mapleader = "\\",
  },
}

return options
