local mappings = {
  [""] = {
    ["Y"] = '"*y',
  },
  n = {
    ["<C-e>"] = { "<cmd>Neotree toggle<cr>", desc = "Toggle Explorer" },
  },
  v = {
    ["p"] = '"_dP',
    ["<Leader>bb"] = ":DB<Enter>",
  },
}

return mappings
