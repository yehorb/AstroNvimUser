local plugins = {
  "Darazaki/indent-o-matic",
  "rcarriga/nvim-notify",
  "stevearc/dressing.nvim",
  "mrjones2014/smart-splits.nvim",
  "nvim-tree/nvim-web-devicons",
  "onsails/lspkind.nvim",
  "akinsho/bufferline.nvim",
  "famiu/bufdelete.nvim",
  "s1n7ax/nvim-window-picker",
  "nvim-neo-tree/neo-tree.nvim",
  "rebelot/heirline.nvim",
  "stevearc/aerial.nvim",
  "nvim-telescope/telescope.nvim",
  "nvim-telescope/telescope-fzf-native.nvim",
  "goolord/alpha-nvim",
  "Shatur/neovim-session-manager",
}

local disable = {}
for _, key in ipairs(plugins) do
  disable[key] = { disable = true }
end

return disable
