local settings = {
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "basic",
        useLibraryCodeForTypes = true,
        reportImportCycles = "warning",
        reportUnusedImport = "warning",
        reportUnusedClass = "warning",
        reportUnusedFunction = "warning",
        reportUnusedVariable = "warning",
        reportDuplicateImport = "warning",
      },
    },
  },
}

return settings
