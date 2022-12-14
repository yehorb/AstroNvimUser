astronvim.which_key_register {
  v = {
    -- <Cmd> does not work, as :DB command requires [range],
    -- and <Cmd> does not provide range by default (as : does via '<,'>).
    -- '<,'> can't be used with <Cmd>, as Command mode is not entered, and
    -- markers are not updated. Using line("v") and line(".") is too much
    -- hassle to go through.
    ["<Leader>bb"] = { ":DB<CR>", "Execute the database query" },
  },
}

vim.g.db = os.getenv "UPROAD_PROD_REDSHIFT_DSN"
