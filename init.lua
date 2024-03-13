vim.g.mapleader = " "
vim.g.maplocalleader = " "

local set_option = function (key, value)
  vim.opt[key] = value
end

-- Line numbers
set_option("number", true)
set_option("relativenumber", true)

-- Indentation
set_option("tabstop", 2)
set_option("shiftwidth", 2)
set_option("expandtab", true)

-- Mouse
set_option("mouse", "a")

-- Undo
set_option("undofile", true)

-- Search
set_option("hlsearch", true)
set_option("incsearch", true)
set_option("ignorecase", true)
set_option("smartcase", true)

-- Update time
set_option("updatetime", 250)
set_option("timeoutlen", 300)

-- Scroll off
set_option("scrolloff", 10)

