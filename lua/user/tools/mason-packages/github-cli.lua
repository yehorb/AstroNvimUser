local Pkg = require "mason-core.package"
local github = require "mason-core.managers.github"

return Pkg.new {
  name = "github-cli",
  desc = [[gh is GitHub on the command line.]],
  homepage = "https://github.com/cli/cli",
  languages = { Pkg.Lang.Shell },
  categories = { "Tool" },
  install = function(ctx)
    github
      .unzip_release_file({
        repo = "cli/cli",
        asset_file = function(version)
          local target = "gh_%s_windows_amd64.zip"
          return target:format(version:gsub("^v", ""))
        end,
      })
      .with_receipt()
    ctx:link_bin("gh", "bin/gh.exe")
  end,
}
