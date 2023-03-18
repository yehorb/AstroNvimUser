local cmp = require "cmp"

local function get_bufnrs()
  local bufs = {}
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    bufs[vim.api.nvim_win_get_buf(win)] = true
  end
  return vim.tbl_keys(bufs)
end

return {
  "hrsh7th/nvim-cmp",
  commit = false,
  opts = function(_, opts)
    opts.sources = cmp.config.sources {
      { name = "nvim_lsp", priority = 1000 },
      { name = "buffer", priority = 750, option = { get_bufnrs = get_bufnrs } },
      { name = "luasnip", priority = 500 },
      { name = "path", priority = 250 },
    }
  end,
}
