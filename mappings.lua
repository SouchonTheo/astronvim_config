-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    -- quick save
    ["<C-s>"] = { ":w!<cr>", desc = "Save File" }, -- change description but the same command
    ["<leader>R"] = {
      function()
        local old_word = vim.fn.input "Word to be replaced: "
        local new_word = vim.fn.input("Replace " .. old_word .. " with: ")
        if new_word ~= "" then vim.cmd(":%s/\\<" .. old_word .. "\\>/" .. new_word .. "/gc") end
      end,
      desc = "Replace a specific word",
    },
    ["<leader>r"] = {
      function()
        local old_word = vim.fn.expand "<cword>"
        local new_word = vim.fn.input("Replace " .. old_word .. " with: ")
        if new_word ~= "" then vim.cmd(":%s/\\<" .. old_word .. "\\>/" .. new_word .. "/gc") end
      end,
      desc = "Replace word with confirmation",
    },
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
  v = {
    ["K"] = {
      ":m '<-2<CR>gv=gv",
      desc = "Move line up",
    },
    ["J"] = {
      ":m '>+1<CR>gv=gv",
      desc = "Move line down",
    },
  },
}
