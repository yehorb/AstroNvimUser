local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
  return {}
end

local h = require "null-ls.helpers"

local terragrunt_hclfmt = {
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

return {
  sources = {
    terragrunt_hclfmt,
  },
}
