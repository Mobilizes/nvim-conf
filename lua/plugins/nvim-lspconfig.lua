return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      return vim.tbl_deep_extend("force", opts, {
        inlay_hints = { enabled = false },
        servers = {
          clangd = {
            cmd = {
              "clangd",
              "--background-index",
              "--clang-tidy",
              "--header-insertion=iwyu",
              "--completion-style=detailed",
              "--function-arg-placeholders",
              "--fallback-style=google",
              "--enable-config",
            },
            keys = {
              { "<leader>ch", ":ClangdSwitchSourceHeader<cr>", desc = "Toggle Source/Header" },
              { "<leader>cI", ":ClangdShowSymbolInfo", desc = "Show Symbol Info" },
            },
          },
          intelephense = {
            settings = {
              intelephense = {
                diagnostics = {
                  enable = false,
                },
              },
            },
          },
        },
      })
    end,
  },
}
