return {
  {
    "folke/noice.nvim",
    opts_extend = { "routes" },
    opts = {
      routes = {
        {
          filter = {
            event = "msg_show",
            any = {
              { find = "Offline" },
            },
          },
          opts = { skip = true },
        },
      },
    },
  },
}
