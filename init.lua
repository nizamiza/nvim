-- Initialize RPM (a plugin manager) and load plugins
require("rpm_init").setup()

-- Use Oil (a file explorer) instead of netrw
require("oil").setup()

-- Load the rest of the configuration
require("lsp")
require("colorscheme")
require("options")
require("keymaps")
require("statusline")
require("user_commands")
