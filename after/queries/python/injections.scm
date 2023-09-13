; extends
(assignment
  left: (identifier) @_id
  right: (string (string_content) @injection.content)
  (#contains? @_id "sql")
  (#set! injection.language "sql"))
