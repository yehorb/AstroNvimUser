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
      filtered_items = {
        visible = true,
      },
      hijack_netrw_behavior = "open_current",
      window = {
        mappings = {
          ["-"] = reveal_parent,
          ["/"] = false,
        },
      },
    },
    event_handlers = {
      {
        event = "neo_tree_buffer_enter",
        handler = function()
          vim.w.neo_tree_alternate_nr = vim.fn.bufnr "#" ---@diagnostic disable-line: param-type-mismatch
        end,
      },
      {
        event = "file_opened",
        handler = function(_)
          pcall(vim.fn.chdir, vim.fn.getcwd())
        end,
      },
    },
  },
}
