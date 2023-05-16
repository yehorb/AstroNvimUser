return {
  "williamboman/mason.nvim",
  opts = function(_, opts)
    local path = require "mason-core.path"
    opts.install_root_dir = path.concat { os.getenv "USERPROFILE", "Tools", "mason" }
    opts.registries = {
      "github:mason-org/mason-registry",
      "lua:user.tools.mason-packages.registry",
    }
  end,
}
