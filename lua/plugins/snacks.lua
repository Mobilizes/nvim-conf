return {
  {
    "folke/snacks.nvim",
    opts = { dashboard = { enabled = false } },
  },
  -- {
  --   "folke/snacks.nvim",
  --   opts = function()
  --     local keys = require("lazyvim.plugins.extras.editor.snacks_picker")
  --
  --     vim.list_extend(keys, {
  --       { "<leader><space>", false, desc = "Find Files (cwd dir)", nowait = true },
  --     })
  --   end,
  -- },
}
