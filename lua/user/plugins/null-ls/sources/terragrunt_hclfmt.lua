local null_ls = require "null-ls"
local h = require "null-ls.helpers"

return {
  name = "terragrunt_hclfmt",
  method = null_ls.methods.FORMATTING,
  filetypes = { "terragurnt", "hcl" },
  generator = h.formatter_factory {
    args = { "hclfmt", "--terragrunt-hclfmt-file", "$FILENAME" },
    command = "terragrunt",
    format = "raw",
    from_temp_file = true,
    to_temp_file = true,
  },
}
