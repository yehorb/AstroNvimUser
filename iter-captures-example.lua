local injections_query = [[
;; query
(assignment
  left: (identifier) @_id
  right: (string
    string_content: (string_content) @injection.content)
  (#set! injection.language "sql")
  (#contains? @_id "sql"))

(assignment
  left: (identifier) @_id
  right: (string
    string_content: (string_content) @injection.content)
  (#set! injection.language "toml")
  (#contains? @_id "toml"))
]]

local injections = vim.treesitter.query.parse("python", injections_query)

local python_source = [[
sql_blob = """
select * from information_schema.tables
"""

toml_blob = """
[owner]
name = "Tom Preston-Werner"
dob = 1979-05-27T07:32:00-08:00
"""
]]

local parser = require("vim.treesitter.languagetree").new(python_source, "python")
local root = parser:parse()[1]:root()

---@param id integer
---@param node TSNode
---@param metadata TSMetadata
local function print_capture(id, node, metadata)
  print("--- capture [" .. tostring(id) .. "] ---")
  print("capture name: [" .. injections.captures[id] .. "]")
  print("metadata: [" .. vim.inspect(metadata) .. "]")
  local is_content = injections.captures[id] == "injection.content"
  local is_sql = metadata["injection.language"] == "sql"
  local is_toml = metadata["injection.language"] == "toml"
  if is_content and is_sql then
    print("sql content: [" .. vim.treesitter.get_node_text(node, python_source) .. "]")
  end
  if is_content and is_toml then
    print("toml content: [" .. vim.treesitter.get_node_text(node, python_source) .. "]")
  end
end

print "----- iter_captures -----"
for id, node, metadata in injections:iter_captures(root, python_source, 0, -1) do
  print_capture(id, node, metadata)
end

print "----- iter_captures -----"
for _, match, metadata in injections:iter_matches(root, python_source, 0, -1) do
  for id, node in pairs(match) do
    print_capture(id, node, metadata)
  end
end
