local helpers = require("helpers")

-- Cancel search highlighting
helpers.set_keymap("<esc>", "<cmd>noh<cr>", { desc = "Cancel search highlighting" })

-- Scroll half a page and keep the cursor in the center
helpers.set_keymap("<c-u>", "<c-u>zz", { desc = "Scroll half a page up" })
helpers.set_keymap("<c-d>", "<c-d>zz", { desc = "Scroll half a page down" })

-- Invoke netr
helpers.set_keymap("<leader>e", "<cmd>Explore<cr>", { desc = "Invoke netrw" })
