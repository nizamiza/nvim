-- Always load plugins
vim.cmd("packloadall")

-- Oil - better file explorer
local oil_installed, oil = pcall(require, "oil")

if oil_installed then
  oil.setup()
end

-- Colorscheme
vim.g.adaptive_colorscheme = vim.tbl_contains(
  { "WezTerm" },
  os.getenv("TERM_PROGRAM")
)

local ColorScheme = require("colorscheme")
ColorScheme.set_transparent_background()

-- Base configuration
require("options")
require("statusline")
require("keymaps")
require("user_commands")

-- Initialize the plugin manager and plugins
require("rpm")
require("rpm.interface").setup({
  after_init = function()
    require("lsp")
    ColorScheme.set_colorscheme()
  end
})
