local M = {}

--- get_root returns python tree root for a given buffer
---@param bufnr integer
---@return TSNode
function M.get_root(bufnr)
  local parser = vim.treesitter.get_parser(bufnr, "python", {})
  local tree = parser:parse()[1]
  return tree:root()
end

---@class Change
---@field start_row integer
---@field end_row integer
---@field content string[]

--- format_sql_injections will format sql injections in a python file using sqlfluff
---@param bufnr integer | nil
function M.format_sql_injections(bufnr)
  bufnr = bufnr or vim.api.nvim_get_current_buf()

  if vim.bo[bufnr].filetype ~= "python" then
    return vim.schedule(function()
      vim.notify(
        "python#format_sql_injections can only be used in Python files",
        vim.log.levels.ERROR,
        { title = "python#format_sql_injections" }
      )
    end)
  end

  local injections = vim.treesitter.query.get("python", "injections")
  if not injections then
    return vim.schedule(function()
      vim.notify(
        "injections query for Python not found",
        vim.log.levels.ERROR,
        { title = "python#format_sql_injections" }
      )
    end)
  end

  local ok, job = pcall(require, "plenary.job")
  if not ok then
    return vim.schedule(function()
      vim.notify(
        "python#format_sql_injections requires plenary.nvim",
        vim.log.levels.ERROR,
        { title = "python#format_sql_injections" }
      )
    end)
  end

  local root = M.get_root(bufnr)

  ---@type Change[]
  local changes = {}
  ---@type Diagnostic[]
  local diagnostics = {}

  for _, match, metadata in injections:iter_matches(root, bufnr, 0, -1) do
    for id, node in pairs(match) do
      if injections.captures[id] == "injection.content" and metadata["injection.language"] == "sql" then
        M.process_capture(node, bufnr, job, changes, diagnostics)
      end
    end
  end

  if #changes ~= 0 then
    for _, change in ipairs(changes) do
      vim.api.nvim_buf_set_lines(bufnr, change.start_row, change.end_row, false, change.content)
    end
  end
  if #diagnostics ~= 0 then
    local ns = vim.api.nvim_create_namespace "sqlfluff"
    vim.diagnostic.set(ns, bufnr, diagnostics, {})
  end
end

--- process_capture filters given node text through the sqlfluff
---@param node TSNode
---@param bufnr integer
---@param job any
---@param changes Change[]
---@param diagnostics Diagnostic[]
function M.process_capture(node, bufnr, job, changes, diagnostics)
  local range = { node:range() }
  local sql = vim.treesitter.get_node_text(node, bufnr)

  local sqlfluff = job:new {
    command = "sqlfluff.exe",
    args = {
      "fix",
      "--nocolor",
      "-",
    },
    writer = { sql },
  }
  ---@type string[], integer
  local stdout, code = sqlfluff:sync()
  ---@type string[]
  local stderr = sqlfluff:stderr_result()

  ---@type Change
  local change = {
    start_row = range[1] + 1,
    end_row = range[3],
    content = stdout,
  }
  table.insert(changes, 1, change)

  if code ~= 0 then
    ---@type Diagnostic
    local diagnostic = {
      buffer = bufnr,
      lnum = range[1],
      end_lnum = range[3],
      col = range[2],
      end_col = range[4],
      severity = vim.diagnostic.severity.ERROR,
      message = table.concat(stderr, "\n"),
      source = "sqlfluff",
      code = tostring(code),
    }
    table.insert(diagnostics, 1, diagnostic)
  end
end

vim.api.nvim_create_user_command("PythonFormatSqlInjections", function()
  M.format_sql_injections()
end, {})
