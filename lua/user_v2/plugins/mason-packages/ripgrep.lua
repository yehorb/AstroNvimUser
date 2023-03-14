local Pkg = require "mason-core.package"
local platform = require "mason-core.platform"
local _ = require "mason-core.functional"
local github = require "mason-core.managers.github"

local coalesce, when = _.coalesce, _.when

return Pkg.new {
  name = "ripgrep",
  desc = [[ripgrep is a line-oriented search tool that recursively searches the current directory for a regex pattern.]],
  homepage = "https://github.com/BurntSushi/ripgrep",
  languages = { Pkg.Lang.Shell },
  categories = { "Tool" },
  ---@async
  ---@param ctx InstallContext
  install = function(ctx)
    local target = coalesce(when(platform.is.win_x64, "ripgrep-%s-x86_64-pc-windows-msvc"))
    github
      .unzip_release_file({
        repo = "BurntSushi/ripgrep",
        asset_file = function(version)
          target = target and target:format(version:gsub("^v", ""))
          return string.format("%s.zip", target)
        end,
      })
      .with_receipt()
    local exe = string.format("%s/%s%s", target, "rg", platform.is.win and ".exe" or "")
    ctx:link_bin("rg", exe)
  end,
}
