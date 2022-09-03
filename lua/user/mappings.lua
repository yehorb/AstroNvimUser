local mappings = {
  [""] = {
    ["Y"] = '"*y',
  },
  n = {
    ["<C-e>"] = { "<cmd>Neotree toggle<cr>", desc = "Toggle Explorer" },
    ["<C-o>"] = { "<cmd>Neotree focus<cr>", desc = "Focus Explorer" },
  },
  v = {
    ["p"] = '"_dP',
    ["<Leader>bb"] = ":DB<Enter>",
  },
}

return mappings
