return {
  automatic_installation = true,
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
}
