local utils = require("utils")

utils.set_keymaps({
  {
    "<esc>",
    "<cmd>noh<cr>",
    { desc = "Cancel search highlighting" }
  },
  {
    "<c-u>",
    "<c-u>zz",
    { desc = "Scroll half a page up" }
  },
  {
    "<c-d>",
    "<c-d>zz",
    { desc = "Scroll half a page down" }
  },
  {
    "<leader>w",
    "<cmd>set wrap!<cr>",
    { desc = "Toggle soft wrap" }
  },
  {
    "<leader>e",
    "<cmd>Explore<cr>",
    { desc = "Invoke netrw" }
  }
})
