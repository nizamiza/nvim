local helpers = require("helpers")

-- Set leader key
helpers.set_global_option("mapleader", " ")
helpers.set_global_option("maplocalleader", " ")

-- Set clipboard
helpers.set_option("clipboard", "unnamedplus")

-- Configure line numbers
helpers.set_option("number", true)
helpers.set_option("relativenumber", true)

-- Setup indentation
helpers.set_option("tabstop", 2)
helpers.set_option("shiftwidth", 2)
helpers.set_option("expandtab", true)

-- Alllow using mouse
helpers.set_option("mouse", "a")

-- Setup undofile
helpers.set_option("undofile", true)
helpers.set_option("undodir", vim.fn.stdpath("data") .. "/undo")

-- Disable swap files
helpers.set_option("swapfile", false)

-- Set search options
helpers.set_option("hlsearch", true)
helpers.set_option("incsearch", true)
helpers.set_option("ignorecase", true)
helpers.set_option("smartcase", true)

-- Setup update time
helpers.set_option("updatetime", 250)
helpers.set_option("timeoutlen", 300)

-- Set scroll off
helpers.set_option("scrolloff", 10)
