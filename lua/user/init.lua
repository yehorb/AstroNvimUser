local function termguicolors()
  if vim.fn.has "termguicolors" then
    return true
  end
  return nil
end

local config = {
  colorscheme = "nord",
  options = {
    opt = {
      fileencoding = "utf-8",
      fileformat = "unix",
      fileformats = { "unix", "dos" },
      linebreak = true,
      list = true,
      listchars = { eol = "¶", tab = "→·", trail = "·", nbsp = "+" },
      showbreak = "> ",
      termguicolors = termguicolors(),
    },
    g = {
      mapleader = "\\",
    },
  },
  header = nil,
  mappings = {
    [""] = {
      ["Y"] = '"*y',
    },
    ["n"] = {
      ["<C-e>"] = { "<cmd>Neotree toggle<cr>", desc = "Toggle Explorer" },
    },
    ["v"] = {
      ["p"] = '"_dP',
      ["<Leader>bb"] = ":DB<Enter>",
    },
  },
  plugins = {
    init = {
      ["akinsho/bufferline.nvim"] = { disable = true },
      ["goolord/alpha-nvim"] = { disable = true },
      { "arcticicestudio/nord-vim" },
      { "tpope/vim-dadbod" },
      { "tpope/vim-surround" },
    },
    treesitter = {
      ensure_installed = {
        "lua",
        "python",
        "sql",
      },
    },
    cmp = {
      sources = {
        {
          name = "buffer",
          option = {
            get_bufnrs = function()
              return vim.api.nvim_list_bufs()
            end,
          },
        },
      },
    },
    ["neo-tree"] = {
      close_if_last_window = false,
      filesystem = {
        filtered_items = {
          visible = true,
        },
      },
    },
  },
  polish = function()
    require "user.autocommands"
  end,
}

return config
