local Utils = require("utils")

local leader = " "

Utils.set_global_option("mapleader", leader)
Utils.set_global_option("maplocalleader", leader)

Utils.set_options({
  clipboard = "unnamedplus",
  number = true,
  tabstop = 2,
  shiftwidth = 2,
  expandtab = true,
  colorcolumn = "80",
  textwidth = 80,
  cursorline = true,
  wrap = false,
  mouse = "a",
  undofile = true,
  undodir = vim.fn.stdpath("data") .. "/undo",
  swapfile = false,
  hlsearch = true,
  incsearch = true,
  ignorecase = true,
  smartcase = true,
  updatetime = 50,
  timeoutlen = 100,
  scrolloff = 10,
})
