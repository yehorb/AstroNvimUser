---get_root returns python tree root for a given buffer
---@param bufnr integer
---@return TSNode
local function get_root(bufnr)
  local parser = vim.treesitter.get_parser(bufnr, "python", {})
  local tree = parser:parse()[1]
  return tree:root()
end

---format_sql_injections will format sql injections in a python file using
---sqlfluff
---@param bufnr integer | nil
local function format_sql_injections(bufnr)
  local ok, job = pcall(require, "plenary.job")
  if not ok then
    return vim.schedule(function()
      vim.notify(
        "format_sql_injections requires plenary.nvim",
        vim.log.levels.ERROR,
        { title = "python#format_sql_injections" }
      )
    end)
  end

  bufnr = bufnr or vim.api.nvim_get_current_buf()

  if vim.bo[bufnr].filetype ~= "python" then
    return vim.schedule(function()
      vim.notify("can only be used in Python files", vim.log.levels.ERROR, { title = "python#format_sql_injections" })
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

  local root = get_root(bufnr)

  local changes = {}
  for id, node in injections:iter_captures(root, bufnr, 0, -1) do
    if injections.captures[id] == "injection.content" then
      local range = { node:range() }
      local lines = vim.split(vim.treesitter.get_node_text(node, bufnr), "\n")
      local sql_injection = table.concat(lines, "\n")
      local task = job:new {
        command = "sqlfluff.exe",
        args = {
          "fix",
          "--nocolor",
          "-",
        },
        writer = { sql_injection },
      }
      local formatted = task:sync()
      table.insert(changes, 1, {
        start_pos = range[1] + 1,
        end_pos = range[3],
        change = formatted,
      })
    end
  end

  for _, change in ipairs(changes) do
    vim.api.nvim_buf_set_lines(bufnr, change.start_pos, change.end_pos, false, change.change)
  end
end

vim.api.nvim_create_user_command("PythonFormatSqlInjections", function()
  format_sql_injections()
end, {})
