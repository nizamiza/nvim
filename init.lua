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
require("keymaps")
require("user_commands")

-- Initialize the plugin manager and plugins
require("rpm")
require("rpm.interface").setup({
  after_init = function()
    require("lsp")

    cs.set_colorscheme()
    require("ibl").setup({
      indent = {
        char = "▏",
        tab_char = "▏",
        highlight = { "Conceal" }
      }
    })
  end
})
