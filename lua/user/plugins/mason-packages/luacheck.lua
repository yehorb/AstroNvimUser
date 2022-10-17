local Pkg = require "mason-core.package"
local _ = require "mason-core.functional"
local github = require "mason-core.managers.github"

return Pkg.new {
  name = "luacheck",
  desc = [[A tool for linting and static analysis of Lua code.]],
  homepage = "https://github.com/mpeterv/luacheck",
  languages = { Pkg.Lang.Lua },
  categories = { Pkg.Cat.Linterr },
  ---@async
  ---@param ctx InstallContext
  install = function(ctx)
    github
      .download_release_file({
        repo = "mpeterv/luacheck",
        asset_file = "luacheck.exe",
        out_file = "luacheck.exe",
      })
      .with_receipt()
    ctx:link_bin("luacheck", "luacheck.exe")
  end,
}
