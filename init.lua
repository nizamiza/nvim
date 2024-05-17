require("rpm_init").setup({
  after_init = function()
    require("lsp")
    require("keymaps")
  end
})

require("oil").setup()

require("colorscheme")
require("options")
require("statusline")
require("user_commands")
