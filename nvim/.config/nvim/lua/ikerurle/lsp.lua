local null_ls = require("null-ls")


null_ls.setup {
  source = {
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.formatting.eslint,
    -- null_ls.builtins.formatting.spell,
  }
}
