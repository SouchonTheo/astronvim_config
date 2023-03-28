return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function() require("todo-comments").setup {} end,
    opts = {},
    event = "User AstroFile",
  },
  {
    "SmiteshP/nvim-navic",
    config = function() require("nvim-navic").setup {} end,
    event = "User AstroFile",
  },
  {
    "nvim-treesitter/nvim-treesitter",
    config = function(...)
      require "plugins.configs.nvim-treesitter"(...)
      local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
      parser_config.cameligo = {
        install_info = {
          url = "/Users/theosouchon/.config/ligo/tools/lsp/squirrel/grammar/camligo",
          files = {
            "src/parser.c",
            "src/scanner.c",
            "src/grammar.json",
            "src/node-types.json",
          },
          branch = "main",
          generate_requires_npm = false,
          requires_generate_from_grammar = true,
        },
        filetype = "mligo",
      }
    end,
  },
}
