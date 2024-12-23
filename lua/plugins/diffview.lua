return {
  "sindrets/diffview.nvim",
  keys = {
    {
      "<leader>gO",
      function()
        local lib = require("diffview.lib")
        local view = lib.get_current_view()
        if view then
          vim.cmd("DiffviewClose")
        else
          vim.cmd("DiffviewOpen")
        end
      end,
      desc = "Toggle Diffview",
    },
  },
}
