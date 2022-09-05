local status_ok, path = pcall(require, "mason-core.path")
if not status_ok then
  return {}
end

local mason = {
  install_root_dir = path.concat { vim.fn.expand "$HOME", "Tools", "mason" },
}

return mason
