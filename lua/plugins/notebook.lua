return {
  "meatballs/notebook.nvim",
  desc = "Notebook (only in .ipynb)",
  keys = {
    {
      "<leader>N",
      desc = "Notebook (only in .ipynb)",
      ft = "python",
    },
    {
      "<leader>NA",
      ":NBAddCell<cr>",
      desc = "Add a cell to the end of notebook",
      ft = "python",
    },
    {
      "<leader>Na",
      ":NBInsertCell<cr>",
      desc = "Insert cell below current cell",
      ft = "python",
    },
    {
      "<leader>Nd",
      ":NBDeleteCell<cr>",
      desc = "Delete the current cell",
      ft = "python",
    },
  },
}
