local Utils = require("utils")

Utils.register_keymaps({
  ["<esc>"] = { "<cmd>noh<cr>", "Cancel search highlighting" },
  ["<c-l>"] = { "<c-u>zz", "Scroll half a page up" },
  ["<c-h>"] = { "<c-d>zz", "Scroll half a page down" },
})

Utils.register_keymaps({
  f = {
    name = "file",
    n = { "<cmd>enew<cr>", "New file" },
    s = { "<cmd>w<cr>", "Save file" },
    q = { "<cmd>q<cr>", "Quit" }
  },
  b = {
    name = "buffer",
    d = { "<cmd>bd<cr>", "Delete buffer" },
    p = { "<cmd>bp<cr>", "Previous buffer" },
    n = { "<cmd>bn<cr>", "Next buffer" },
    o = { "<cmd>DeleteOtherBuffers<cr>", "Delete other buffers" },
  },
  t = {
    name = "toggle",
    w = { "<cmd>set wrap!<cr>", "Toggle soft wrap" },
  },
}, { prefix = "<leader>" })
