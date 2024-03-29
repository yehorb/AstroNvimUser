return function()
  require "user.autocommands"

  if vim.fn.executable "rg" == 1 then
    require "user.tools.ripgrep"
  end

  vim.opt.rtp:append(string.format("%s\\after", astronvim.install.config))

  vim.filetype.add {
    filename = {
      [".sqlfluff"] = "toml",
    },
  }
end
