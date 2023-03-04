local cmp = require "cmp"

local function get_bufnrs()
  local bufs = {}
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    bufs[vim.api.nvim_win_get_buf(win)] = true
  end
  return vim.tbl_keys(bufs)
end

local sources = {
  {
    name = "buffer",
    option = {
      get_bufnrs = get_bufnrs,
    },
  },
}

return function(options)
  options.soruces = vim.list_extend(options.sources or {}, sources, 1, #sources)

  options.mapping["<C-x>"] = function(fallback)
    if not cmp.visible() then
      cmp.complete()
    else
      fallback()
    end
  end

  return options
end
