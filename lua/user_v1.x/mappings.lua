local mappings = {
  [""] = {
    ["<Leader>bd"] = '<Cmd>write | %bdelete | edit # | bdelete # | normal `"<CR>',
    ["Y"] = '"*y',
  },
  n = {
    ["<C-B>"] = ":buffer ",
    ["<C-P>"] = ":find ",
  },
  v = {
    ["p"] = '"_dP',
  },
}

return mappings
