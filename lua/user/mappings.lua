local mappings = {
  [""] = {
    ["Y"] = '"*y',
  },
  n = {
    ["<C-B>"] = ":buffer ",
    ["<C-P>"] = ":find ",
    ["<Leader>e"] = { "<cmd>Neotree focus<cr>", desc = "Focus Explorer" },
    ["<Leader>o"] = false,
  },
  v = {
    ["p"] = '"_dP',
  },
}

return mappings
