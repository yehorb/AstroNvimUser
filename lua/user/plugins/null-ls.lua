local function format_before_save(bufnr)
  vim.api.nvim_create_augroup("null-ls", { clear = true })
  vim.api.nvim_create_autocmd("BufWritePre", {
    group = "null-ls",
    desc = "Format before save.",
    buffer = bufnr,
    callback = function()
      vim.lsp.buf.formatting_sync()
    end,
  })
end

local setup = {
  on_attach = function(client, bufnr)
    if
      vim.fn.has "nvim-0.8.0" and client.server_capabilities["textDocument/formatting"]
      or client.resolved_capabilities.document_formatting
    then
      format_before_save(bufnr)
    end
  end,
}

return setup
