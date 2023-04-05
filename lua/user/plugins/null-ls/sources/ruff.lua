local h = require "null-ls.helpers"
local methods = require "null-ls.methods"
local DIAGNOSTICS_ON_SAVE = methods.internal.DIAGNOSTICS_ON_SAVE

local severities = {
  E = h.diagnostics.severities["error"], -- pycodestyle errors
  W = h.diagnostics.severities["warning"], -- pycodestyle warnings
  F = h.diagnostics.severities["information"], -- pyflakes
  A = h.diagnostics.severities["information"], -- flake8-builtins
  B = h.diagnostics.severities["warning"], -- flake8-bugbear
  C = h.diagnostics.severities["warning"], -- flake8-comprehensions
  T = h.diagnostics.severities["information"], -- flake8-print
  U = h.diagnostics.severities["information"], -- pyupgrade
  D = h.diagnostics.severities["information"], -- pydocstyle
  M = h.diagnostics.severities["information"], -- Meta
}

return {
  name = "ruff",
  meta = {
    url = "https://github.com/charliermarsh/ruff/",
    description = "An extremely fast Python linter, written in Rust.",
  },
  method = DIAGNOSTICS_ON_SAVE,
  filetypes = { "python" },
  generator = h.generator_factory {
    command = "ruff",
    args = function(params)
      return {
        "check",
        "--no-cache",
        "--exit-zero",
        "--format",
        "json",
        params.root,
      }
    end,
    format = "json",
    check_exit_code = function(code)
      return code == 0
    end,
    to_stdin = true,
    ignore_stderr = true,
    on_output = function(params)
      local diagnostics = {}
      for _, json_diagnostic in ipairs(params.output) do
        local diagnostic = {
          message = json_diagnostic["message"],
          severity = severities[json_diagnostic["code"]:sub(1, 1)] or h.diagnostics.severities["information"],
          row = json_diagnostic["location"]["row"],
          col = json_diagnostic["location"]["column"],
          end_row = json_diagnostic["end_location"]["row"],
          end_col = json_diagnostic["end_location"]["column"],
          source = "Ruff",
          code = json_diagnostic["code"],
          filename = json_diagnostic["filename"],
          bufnr = nil,
        }
        table.insert(diagnostics, diagnostic)
      end

      return diagnostics
    end,
    multiple_files = true,
  },
}
