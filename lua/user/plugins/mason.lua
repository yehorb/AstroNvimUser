return {
  "williamboman/mason.nvim",
  opts = function(_, opts)
    local path = require "mason-core.path"
    opts.install_root_dir = path.concat { os.getenv "USERPROFILE", "Tools", "mason" }
  end,
  config = function(plugin, opts)
    require "plugins.configs.mason"(plugin, opts)
    require "user.tools.mason-packages"
  end,
}
