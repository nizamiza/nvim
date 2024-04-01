-- Always load plugins
vim.cmd("packloadall")

-- Colorscheme
vim.g.adaptive_colorscheme = vim.tbl_contains(
  { "WezTerm" },
  os.getenv("TERM_PROGRAM")
)

local cs = require("colorscheme")

-- Base configuration
require("options")
require("statusline")
require("remaps")

-- Initialize the plugin manager and plugins
require("rpm")
require("rpm.interface").setup({
  after_init = function()
    cs.set_colorscheme()
  end
})
