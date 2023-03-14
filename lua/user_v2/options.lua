local platform = require "user.platform"
local netrw = require "user.options.netrw"

local rg_options = vim.fn.executable "rg" == 1
    and {
      grepformat = vim.opt.grepformat + { "%f:%l:%c:%m" },
      grepprg = "rg --block-buffered --hidden --no-heading --smart-case --vimgrep",
    }
  or {}

return {
  opt = vim.tbl_extend("force", {
    clipboard = "",
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
    splitbelow = false,
    splitright = false,
    wrap = true,
  }, platform.shell(), platform.fileformat(), rg_options),
  g = vim.tbl_extend("force", {
    mapleader = "\\",
    pyindent_disable_parentheses_indenting = true,
  }, netrw),
}
