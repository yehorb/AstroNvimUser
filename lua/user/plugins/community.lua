return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.colorscheme.nord-nvim" },
  {
    "shaunsingh/nord.nvim",
    enabled = false,
    lazy = false,
    priority = 1000,
    config = function(_, _)
      vim.cmd.colorscheme "nord"
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          client.server_capabilities.semanticTokensProvider = nil
        end,
      })
    end,
  },
  { import = "astrocommunity.colorscheme.nordic-nvim" },
  {
    "AlexvZyl/nordic.nvim",
    enabled = true,
    lazy = false,
    priority = 1000,
  },
}
