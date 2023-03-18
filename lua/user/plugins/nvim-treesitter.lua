return {
  "nvim-treesitter/nvim-treesitter",
  cmd = { "TSInstallCollection" },
  dependencies = {
    { "nvim-treesitter/nvim-treesitter-textobjects" },
    { "nvim-treesitter/playground" },
  },
  opts = function(_, opts)
    opts.ensure_installed = { "c", "lua", "vim", "help" }
    require("nvim-treesitter.install").prefer_git = false
  end,
  config = function(plugin, opts)
    require "plugins.configs.nvim-treesitter"(plugin, opts)
    require("user.commands.nvim-treesitter").setup {
      build = { "cmake", "make" },
      config = { "toml", "yaml" },
      editor = { "comment", "query" },
      html = { "css", "html", "scss" },
      json = { "hjson", "json", "json5", "jsonc" },
      markup = { "latex", "markdown" },
      shell = { "bash" },
      terraform = { "hcl", "terraform" },
      tiobe = { "c_sharp", "cpp", "go", "java", "javascript", "python", "rust", "sql" },
      tools = { "dockerfile", "dot", "perl" },
      typescript = { "typescript" },
    }
  end,
}
