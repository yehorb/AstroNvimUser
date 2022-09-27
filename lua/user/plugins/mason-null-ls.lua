local setup = {
  ensure_installed = {
    -- lua
    "selene",
    "stylua",

    -- python
    "black",
    "flake8",
    "isort",
    "mypy",
  },
  automatic_installation = false,
}

return setup
