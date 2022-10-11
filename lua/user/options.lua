local platform = require "user.platform"

return {
  opt = vim.tbl_extend("force", {
    fileencoding = "utf-8",
    linebreak = true,
    list = true,
    listchars = { eol = "¶", tab = "→·", trail = "·", nbsp = "+" },
    path = vim.opt.path + { "**" },
    scrolloff = 4,
    showbreak = ">> ",
    wrap = true,
  }, platform.shell(), platform.fileformat()),
  g = {
    mapleader = "\\",
  },
}
