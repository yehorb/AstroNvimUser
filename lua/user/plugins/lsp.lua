return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "j-hui/fidget.nvim", config = true },
      { "simrat39/rust-tools.nvim", ft = "rust" },
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      automatic_installation = false,
      ensure_installed = {
        "lua_ls",
        "pyright",
        "terraformls",
      },
    },
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function(_, opts)
      local null_ls = require "null-ls"
      opts.sources = {
        null_ls.builtins.diagnostics.flake8,
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.isort,
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.diagnostics.mypy.with {
          extra_args = { string.format("--python-executable=%s", vim.fn.exepath "python") },
        },
        require "user.plugins.null-ls.sources.ruff",
        require "user.plugins.null-ls.sources.terragrunt_hclfmt",
      }
    end,
  },
  {
    "jay-babu/mason-null-ls.nvim",
    opts = function(_, opts)
      local fs = require "user.std.fs"
      local null_ls = require "null-ls"
      opts.automatic_installation = false
      opts.ensure_installed = {
        -- lua
        "selene",
        "stylua",
        -- python
        "black",
        "flake8",
        "isort",
        "mypy",
        "ruff_lsp",
      }
      opts.handlers = {
        function() end,
        selene = function()
          if fs.is_in_cwd "selene.toml" then
            null_ls.register(null_ls.builtins.diagnostics.selene)
          end
        end,
      }
    end,
  },
}
