local null_ls = require "null-ls"

return {
  sources = {
    null_ls.builtins.diagnostics.flake8,
    null_ls.builtins.diagnostics.mypy,
    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.isort,
    require "user.plugins.null-ls.sources.terragrunt_hclfmt",
  },
}
