local path = require "mason-core.path"
local platform = require "user.platform"

require "user.plugins.mason-packages"

return {
  install_root_dir = path.concat { platform.home(), "Tools", "mason" },
}
