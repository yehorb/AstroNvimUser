local path = require "mason-core.path"
local platform = require "user.platform"

return {
  install_root_dir = path.concat { platform.home(), "Tools", "mason" },
}
