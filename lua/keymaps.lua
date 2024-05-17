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
  w = {
    name = "window",
    s = { "<cmd>split<cr>", "Split window" },
    v = { "<cmd>vsplit<cr>", "Vsplit window" },
    c = { "<cmd>close<cr>", "Close window" },
    ["<up>"] = { "<c-w><up>", "Move to the top window" },
    ["<right>"] = { "<c-w><right>", "Move to the right window" },
    ["<down>"] = { "<c-w><down>", "Move to the bottom window" },
    ["<left>"] = { "<c-w><left>", "Move to the left window" },
  },
}, { prefix = "<leader>" })
