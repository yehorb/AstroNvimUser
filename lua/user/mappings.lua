vim.keymap.set({ "n", "v" }, "Y", '"*y')
return {
  n = {
    ["<C-b>"] = ":buffer ",
    ["<C-p>"] = ":find ",
    ["<Leader>bd"] = '<Cmd>write | %bdelete | edit # | bdelete # | normal `"<CR>',
    ["vv"] = "<C-v>",
    ["\\"] = false,
    ["|"] = false,
  },
  v = {
    ["?"] = [[y/\V<C-R>=escape(@",'/\')<CR>]],
    ["p"] = '"_dP',
  },
}
