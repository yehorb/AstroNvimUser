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
  { name = "nvim_lsp_signature_help" },
}

local function complete_or(options, key)
  local existing_action = options.mapping[key]
  options.mapping[key] = function(_)
    if not cmp.visible() then
      cmp.complete()
    else
      existing_action()
    end
  end
end

return function(options)
  options.soruces = vim.list_extend(options.sources or {}, sources, 1, #sources)
  complete_or(options, "<C-n>")
  complete_or(options, "<C-p>")
  return options
end
