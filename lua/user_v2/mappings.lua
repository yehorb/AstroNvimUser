return {
  [""] = {
    ["<Leader>bd"] = '<Cmd>write | %bdelete | edit # | bdelete # | normal `"<CR>',
    ["Y"] = '"*y',
  },
  n = {
    ["<C-b>"] = ":buffer ",
    ["<C-p>"] = ":find ",
    ["\\"] = false,
    ["|"] = false,
    ["vv"] = "<C-v>",
  },
  v = {
    ["/"] = ":s/",
    ["?"] = [[y/\V<C-R>=escape(@",'/\')<CR>]],
    ["p"] = '"_dP',
  },
}
