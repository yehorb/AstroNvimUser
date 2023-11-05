return {
  on_attach = function(client, _)
    client.server_capabilities.semanticTokensProvider = nil
  end,
}
