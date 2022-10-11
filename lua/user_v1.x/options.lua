local shell = require "user.shell"

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
    path = vim.opt.path + { "**" },
    scrolloff = 4,
    showbreak = ">> ",
    termguicolors = termguicolors(),
    wrap = true,
  }, shell.shell()),
  g = {
    mapleader = "\\",
  },
}

return options
