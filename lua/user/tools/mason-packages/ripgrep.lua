local Pkg = require "mason-core.package"
local github = require "mason-core.managers.github"

return Pkg.new {
  name = "ripgrep",
  desc = [[ripgrep is a line-oriented search tool that recursively searches the current directory for a regex pattern.]],
  homepage = "https://github.com/BurntSushi/ripgrep",
  languages = { Pkg.Lang.Shell },
  categories = { "Tool" },
  install = function(ctx)
    local target = "ripgrep-%s-x86_64-pc-windows-msvc"
    github
      .unzip_release_file({
        repo = "BurntSushi/ripgrep",
        asset_file = function(version)
          target = target:format(version:gsub("^v", ""))
          return string.format("%s.zip", target)
        end,
      })
      .with_receipt()
    ctx:link_bin("rg", string.format("%s/%s", target, "rg.exe"))
  end,
}
