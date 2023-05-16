; extends
(assignment
  left: (identifier) @_id
  (#contains? @_id "sql")
  right: (string
    string_content: (string_content) @injection.content
    (#set! injection.language "sql")))
