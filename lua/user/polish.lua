return function()
  require "user.autocommands"

  if vim.fn.executable "rg" == 1 then
    require "user.tools.ripgrep"
  end
end
