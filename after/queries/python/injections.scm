; extends
(assignment
  left: (identifier) @_id
  right: (string
    string_content: (string_content) @injection.content)
  (#set! injection.language "sql")
  (#contains? @_id "sql"))
