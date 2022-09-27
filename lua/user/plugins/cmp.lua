local function get_bufnrs()
  local bufs = {}
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    bufs[vim.api.nvim_win_get_buf(win)] = true
  end
  return vim.tbl_keys(bufs)
end

local setup = {
  sources = {
    {
      name = "buffer",
      option = {
        get_bufnrs = get_bufnrs,
      },
    },
  },
}

return setup
