return {
  "jose-elias-alvarez/null-ls.nvim",
  opts = function(_, config)
    -- config variable is the default configuration table for the setup function call
    local null_ls = require "null-ls"

    -- Check supported formatters and linters
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
    config.sources = {
      -- Set a formatter
      null_ls.builtins.formatting.stylua,
      null_ls.builtins.formatting.rustfmt,
      null_ls.builtins.diagnostics.actionlint,
      null_ls.builtins.formatting.perltidy,
      -- Java
      null_ls.builtins.formatting.google_java_format,
      null_ls.builtins.diagnostics.checkstyle.with {
        extra_args = { "-c", "/google_checks.xml" }, -- or "/sun_checks.xml" or path to self written rules
      },
      -- Set everything else as a linter
      -- null_ls.builtins.code_actions.eslint,
      -- null_ls.builtins.formatting.prettier,
      -- null_ls.builtins.formatting.prettier.with {
      --   filetypes = {
      --     "css",
      --     "html",
      --     "json",
      --     "markdown",
      --     "yaml",
      --     "javascript",
      --     "typescript",
      --   },
      -- },
      null_ls.builtins.formatting.eslint,
      -- null_ls.builtins.diagnostics.eslint,
    }
    return config -- return final config table
  end,
}
