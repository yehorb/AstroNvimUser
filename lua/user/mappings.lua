return {
  [""] = {
    ["<Leader>bd"] = '<Cmd>write | %bdelete | edit # | bdelete # | normal `"<CR>',
    ["Y"] = '"*y',
  },
  n = {
    ["<C-b>"] = ":buffer ",
    ["<C-p>"] = ":find ",
  },
  v = {
    ["p"] = '"_dP',
  },
}
