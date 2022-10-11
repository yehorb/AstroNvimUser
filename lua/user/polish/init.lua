return function()
  require "user.polish.autocommands"

  -- enable netrw
  -- using astronvim.vim_opts { g = { ... } } does not work
  -- ["key"] = nil gets removed by lua parser...
  vim.g.loaded_netrwFileHandlers = nil
  vim.g.loaded_netrwPlugin = nil
  vim.g.loaded_netrwSettngs = nil
end
