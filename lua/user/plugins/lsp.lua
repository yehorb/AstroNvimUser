return {
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
        null_ls.builtins.diagnostics.mypy,
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.isort,
        require "user.plugins.null-ls.sources.terragrunt_hclfmt",
      }
    end,
  },
  {
    "jay-babu/mason-null-ls.nvim",
    opts = {
      automatic_installation = false,
      ensure_installed = {
        "selene",
        "stylua",
      },
    },
    config = function(_, opts)
      local fs = require "user.services.fs"
      local mason_null_ls = require "mason-null-ls"
      local null_ls = require "null-ls"
      mason_null_ls.setup(opts)
      mason_null_ls.setup_handlers {
        selene = function()
          if fs.is_in_cwd "selene.toml" then
            null_ls.register(null_ls.builtins.diagnostics.selene)
          end
        end,
      }
    end,
  },
}
