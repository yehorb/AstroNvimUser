local powershell = {
  shell = vim.fn.executable "pwsh" and "pwsh" or "powershell",
  shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;",
  shellredir = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode",
  shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode",
  shellquote = "",
  shellxquote = "",
}

local unix_fileformat = {
  fileformat = "unix",
  fileformats = { "unix", "dos" },
}

return {
  opt = vim.tbl_extend("force", powershell, unix_fileformat, {
    clipboard = "",
    cmdheight = 1,
    foldcolumn = "0",
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
  }),
}
