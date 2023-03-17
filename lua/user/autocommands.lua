vim.api.nvim_create_autocmd("BufNewFile,BufRead", {
  group = vim.api.nvim_create_augroup("User_DboutFiletype", { clear = true }),
  pattern = "*.dbout",
  desc = "*.dbout generated by vim-dadbod is usually pgsql.",
  command = "let b:sql_type_override='pgsql' | setfiletype sql",
})

local function quickfix_mapping(args)
  local options = { buffer = args.buf }
  vim.keymap.set("n", "j", "j<CR>zz<Cmd>wincmd w<CR>", options)
  vim.keymap.set("n", "k", "k<CR>zz<Cmd>wincmd w<CR>", options)
  vim.keymap.set("n", "<CR>", "<CR><Cmd>cclose<CR>", options)
  vim.keymap.set("n", "q", "<Cmd>quit<CR>", options)
end

vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("User_QuickfixMappings", { clear = true }),
  pattern = "qf",
  desc = "jk in quickfix list should jump to location in buffer.",
  callback = quickfix_mapping,
})
