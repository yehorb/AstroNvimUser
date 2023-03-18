return {
  "nvim-neo-tree/neo-tree.nvim",
  keys = {
    { "<leader>e", false },
    { "<leader>o", false },
    {
      "-",
      function()
        if vim.bo.filetype ~= "neo-tree" then
          vim.cmd.Neotree { "position=current", "reveal" }
        end
      end,
    },
  },
  opts = {
    filesystem = {
      hijack_netrw_behavior = "open_current",
      window = {
        mappings = {
          ["-"] = "parent_or_close",
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
        vim.keymap.set("n", "<C-^>", function()
          local alternate_nr = vim.fn.bufnr "#" ---@diagnostic disable-line: param-type-mismatch
          if vim.w.neo_tree_alternate_nr ~= nil then
            alternate_nr = vim.w.neo_tree_alternate_nr
          end
          vim.w.neo_tree_alternate_nr = nil
          vim.cmd.buffer(alternate_nr)
        end)
      end
    end
    vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
      group = vim.api.nvim_create_augroup("NeoTree_BufEnter", { clear = true }),
      pattern = "neo-tree *",
      callback = bufenter,
    })
  end,
}
