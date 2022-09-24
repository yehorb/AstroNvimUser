local mappings = {
  [""] = {
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
