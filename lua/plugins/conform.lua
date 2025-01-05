return {
  "stevearc/conform.nvim",
  opts = {
    notify_on_error = true,
    formatter_by_ft = {
      c = { "clang_format" },
    },
    formatters = {
      clang_format = {
        prepend_args = { "--style=file", "--fallback-style=google" },
      },
    },
  },
}
