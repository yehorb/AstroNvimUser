local status_ok, _ = pcall(require, "null-ls")
if not status_ok then
  return {}
end

return {
  sources = {
    require "user.plugins.null-ls.sources.terragrunt_hclfmt",
  },
}
