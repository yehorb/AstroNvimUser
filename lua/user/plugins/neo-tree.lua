local function opendir()
  if vim.bo.filetype ~= "neo-tree" then
    vim.cmd.Neotree { "position=current", "reveal" }
  end
end

local function toggle_node(state)
  local node = state.tree:get_node()
  if (node.type == "directory" or node:has_children()) and node:is_expanded() then
    state.commands.toggle_node(state)
  end
  return node
end

local function reveal_parent(state)
  toggle_node(state)
  require("neo-tree.ui.renderer").focus_node(state, state.tree:get_node():get_parent_id())
  toggle_node(state)
end

return {
  "nvim-neo-tree/neo-tree.nvim",
  keys = {
    { "<leader>e", false },
    { "<leader>o", false },
    { "-", opendir },
  },
  config = function(_, opts)
    opts = vim.tbl_deep_extend("force", opts, {
      filesystem = {
        hijack_netrw_behavior = "open_current",
        window = {
          mappings = {
            ["-"] = reveal_parent,
          },
        },
      },
    })
    require("neo-tree").setup(opts)
    -- removes the "Window settings restored" message
    vim.api.nvim_del_augroup_by_name "NeoTree_BufLeave"
  end,
}
