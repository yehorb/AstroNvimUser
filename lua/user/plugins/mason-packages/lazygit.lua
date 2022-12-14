local Pkg = require "mason-core.package"
local platform = require "mason-core.platform"
local _ = require "mason-core.functional"
local github = require "mason-core.managers.github"

local coalesce, when = _.coalesce, _.when

return Pkg.new {
  name = "lazygit",
  desc = [[simple terminal UI for git commands]],
  homepage = "https://github.com/jesseduffield/lazygit",
  languages = { Pkg.Lang.Git },
  categories = { "Tool" },
  ---@async
  ---@param ctx InstallContext
  install = function(ctx)
    github
      .unzip_release_file({
        repo = "jesseduffield/lazygit",
        asset_file = function(version)
          local target = coalesce(when(platform.is.win_x64, "lazygit_%s_Windows_x86_64.zip"))
          return target and target:format(version:gsub("^v", ""))
        end,
      })
      .with_receipt()
    ctx:link_bin("lazygit", platform.is.win and "lazygit.exe" or "lazygit")
  end,
}
