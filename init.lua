-- Set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Load plugins
vim.cmd("packloadall")

require("options")
require("plugins")

