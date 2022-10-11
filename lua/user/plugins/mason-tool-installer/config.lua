local status_ok, mason_tool_installer = pcall(require, "mason-tool-installer")
if not status_ok then
  return {}
end

local index
status_ok, index = pcall(require, "mason-registry.index")
if not status_ok then
  return {}
end

-- add custom package name to mason-registry
index["broot"] = "user.plugins.mason-packages.broot"
index["github-cli"] = "user.plugins.mason-packages.github-cli"
index["lazygit"] = "user.plugins.mason-packages.lazygit"

mason_tool_installer.setup {
  ensure_installed = {
    "broot",
    "github-cli",
    "lazygit",
  },
  run_on_start = true,
}
