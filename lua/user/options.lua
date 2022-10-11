return {
  opt = {
    fileencoding = "utf-8",
    fileformat = "unix",
    fileformats = { "unix", "dos" },
    linebreak = true,
    list = true,
    listchars = { eol = "¶", tab = "→·", trail = "·", nbsp = "+" },
    path = vim.opt.path + { "**" },
    scrolloff = 4,
    showbreak = ">> ",
    wrap = true,
  },
  g = {
    mapleader = "\\",
  },
}
