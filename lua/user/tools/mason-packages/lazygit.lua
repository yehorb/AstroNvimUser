local Pkg = require "mason-core.package"
local github = require "mason-core.managers.github"

return Pkg.new {
  name = "lazygit",
  desc = [[simple terminal UI for git commands]],
  homepage = "https://github.com/jesseduffield/lazygit",
  languages = { Pkg.Lang.Git },
  categories = { "Tool" },
  install = function(ctx)
    github
      .unzip_release_file({
        repo = "jesseduffield/lazygit",
        asset_file = function(version)
          local target = "lazygit_%s_Windows_x86_64.zip"
          return target:format(version:gsub("^v", ""))
        end,
      })
      .with_receipt()
    ctx:link_bin("lazygit", "lazygit.exe")
  end,
}
