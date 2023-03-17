local install = require "nvim-treesitter.install"

local M = {}

---@class Collections { [string]: string[] }
---@param collections Collections collection is a named set of parsers
---@return function installer closure over collections to be used with the TSInstallCollection command
local function installer_for(collections)
  return function(opts)
    local installer = opts.bang and install.ensure_installed_sync or install.ensure_installed
    if opts.args == "all" then
      opts.fargs = vim.tbl_keys(collections)
    end
    for _, collection in ipairs(opts.fargs) do
      if collections[collection] then
        installer(collections[collection])
        vim.schedule(function()
          vim.notify(
            string.format("installed TS collection %s", collection),
            vim.log.levels.INFO,
            { title = "TSInstallCollection" }
          )
        end)
      else
        vim.schedule(function()
          vim.notify(
            string.format("TS collection %s does not exist", collection),
            vim.log.levels.ERROR,
            { title = "TSInstallCollection" }
          )
        end)
      end
    end
  end
end

---@param collections Collections collection is a named set of parsers
function M.setup(collections)
  vim.api.nvim_create_user_command("TSInstallCollection", installer_for(collections), {
    nargs = "+",
    bang = true,
    complete = function(_, _, _)
      return vim.tbl_keys(collections)
    end,
    desc = "Install a TS collection. TS collection is a set of parser names.",
  })
end

return M
