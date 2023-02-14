vim.api.nvim_create_augroup("user", { clear = true })

vim.api.nvim_create_autocmd("BufNewFile,BufRead", {
  group = "user",
  pattern = "*.dbout",
  desc = "*.dbout generated by vim-dadbod is usually pgsql.",
  command = "let b:sql_type_override='pgsql' | set syntax=sql | set filetype=sql",
})

local function quickfix_mapping(args)
  local options = { buffer = args.buf }
  vim.keymap.set("n", "j", "j<CR><Cmd>copen<CR>", options)
  vim.keymap.set("n", "k", "k<CR><Cmd>copen<CR>", options)
  vim.keymap.set("n", "<CR>", "<CR><Cmd>cclose<CR>", options)
  vim.keymap.set("n", "q", "<Cmd>quit<CR>", options)
end

vim.api.nvim_create_autocmd("FileType", {
  group = "user",
  pattern = "quickfix",
  desc = "jk in quickfix list should jump to location in buffer.",
  callback = quickfix_mapping,
})
