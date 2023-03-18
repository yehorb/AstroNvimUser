local Pkg = require "mason-core.package"
local github = require "mason-core.managers.github"

return Pkg.new {
  name = "broot",
  desc = [[A better way to navigate directories]],
  homepage = "https://github.com/Canop/broot",
  languages = { Pkg.Lang.Shell },
  categories = { "Tool" },
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
    ctx:link_bin("broot", "x86_64-pc-windows-gnu/broot.exe")
  end,
}
