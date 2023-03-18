local function reveal_tree()
  if vim.bo.filetype ~= "neo-tree" then
    vim.cmd.Neotree { "position=current", "reveal" }
  end
end

local function reveal_parent(state)
  require("neo-tree.ui.renderer").focus_node(state, state.tree:get_node():get_parent_id())
end

local function edit_neo_tree_alternate_file()
  local alternate_nr = vim.w.neo_tree_alternate_nr or vim.fn.bufnr "#" ---@diagnostic disable-line: param-type-mismatch
  vim.w.neo_tree_alternate_nr = nil
  vim.cmd.buffer(alternate_nr)
end

return {
  "nvim-neo-tree/neo-tree.nvim",
  keys = {
    { "<leader>e", false },
    { "<leader>o", false },
    { "-", reveal_tree },
    { "<C-^>", edit_neo_tree_alternate_file },
  },
  opts = {
    filesystem = {
      hijack_netrw_behavior = "open_current",
      window = {
        mappings = {
          ["-"] = reveal_parent,
        },
      },
    },
  },
  config = function(_, opts)
    require("neo-tree").setup(opts)
    -- removes the "Window settings restored" message
    vim.api.nvim_del_augroup_by_name "NeoTree_BufLeave"
    local bufenter = function(data)
      local pattern = "neo%-tree [^ ]+ %[1%d%d%d%]"
      if string.match(data.file, pattern) then
        vim.w.neo_tree_alternate_nr = vim.fn.bufnr "#" ---@diagnostic disable-line: param-type-mismatch
      end
    end
    vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
      group = vim.api.nvim_create_augroup("NeoTree_BufEnter", { clear = true }),
      pattern = "neo-tree *",
      callback = bufenter,
    })
  end,
}
