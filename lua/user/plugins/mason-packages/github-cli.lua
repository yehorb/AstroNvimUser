local Pkg = require "mason-core.package"
local platform = require "mason-core.platform"
local _ = require "mason-core.functional"
local github = require "mason-core.managers.github"

local coalesce, when = _.coalesce, _.when

return Pkg.new {
  name = "GitHub CLI",
  desc = [[gh is GitHub on the command line.]],
  homepage = "https://github.com/cli/cli",
  languages = { Pkg.Lang.Shell },
  categories = { Pkg.Cat.Tool },
  ---@async
  ---@param ctx InstallContext
  install = function(ctx)
    github
      .unzip_release_file({
        repo = "cli/cli",
        asset_file = function(version)
          local target = coalesce(when(platform.is.win_x64, "gh_%s_windows_amd64.zip"))
          return target and target:format(version:gsub("^v", ""))
        end,
      })
      .with_receipt()
    ctx:link_bin("gh", platform.is.win and "bin/gh.exe" or "bin/gh")
  end,
}
