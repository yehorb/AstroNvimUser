; extends
(assignment
  left: (identifier) @name
  right: (string (string_content) @injection.content)
  (#contains? @name "sql")
  (#set! injection.language "sql"))

(assignment
  left: (identifier) @name
  right: (string (string_content) @injection.content)
  (#contains? @name "yaml")
  (#set! injection.language "yaml"))
