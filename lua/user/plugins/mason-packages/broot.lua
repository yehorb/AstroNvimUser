local Pkg = require "mason-core.package"
local platform = require "mason-core.platform"
local _ = require "mason-core.functional"
local github = require "mason-core.managers.github"

return Pkg.new {
  name = "broot",
  desc = [[A better way to navigate directories]],
  homepage = "https://github.com/Canop/broot",
  languages = { Pkg.Lang.Shell },
  categories = { "Tool" },
  ---@async
  ---@param ctx InstallContext
  install = function(ctx)
    github
      .unzip_release_file({
        repo = "Canop/broot",
        asset_file = function(version)
          local target = "broot_%s.zip"
          return target:format(version:gsub("^v", ""))
        end,
      })
      .with_receipt()
    platform.when {
      mac = function() end,
      linux = function() end,
      unix = function() end,
      win = function()
        ctx:link_bin("broot", "x86_64-pc-windows-gnu/broot.exe")
        ctx:link_bin("br", "x86_64-pc-windows-gnu/broot.exe")
      end,
    }
  end,
}
