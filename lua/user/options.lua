local platform = require "user.platform"

return {
  opt = vim.tbl_extend("force", {
    cmdheight = 1,
    fileencoding = "utf-8",
    linebreak = true,
    list = true,
    listchars = { eol = "¶", tab = "→·", trail = "·", nbsp = "+" },
    path = vim.opt.path + { "**" },
    scrolloff = 4,
    showbreak = ">> ",
    showmode = true,
    showtabline = 1,
    wrap = true,
  }, platform.shell(), platform.fileformat()),
  g = {
    mapleader = "\\",
  },
}
