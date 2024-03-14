local helpers = require("helpers")

-- Line numbers
helpers.set_option("number", true)
helpers.set_option("relativenumber", true)

-- Indentation
helpers.set_option("tabstop", 2)
helpers.set_option("shiftwidth", 2)
helpers.set_option("expandtab", true)

-- Mouse
helpers.set_option("mouse", "a")

-- Undo
helpers.set_option("undofile", true)

-- Swap files
helpers.set_option("swapfile", false)

-- Search
helpers.set_option("hlsearch", true)
helpers.set_option("incsearch", true)
helpers.set_option("ignorecase", true)
helpers.set_option("smartcase", true)

-- Update time
helpers.set_option("updatetime", 250)
helpers.set_option("timeoutlen", 300)

-- Scroll off
helpers.set_option("scrolloff", 10)
