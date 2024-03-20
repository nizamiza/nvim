local helpers = require("helpers")

local color_scheme = {
  dark = "github_dark_high_contrast",
  light = "github_light_high_contrast"
}

local init_colorscheme = vim.api.nvim_create_augroup("init_colorscheme", {})

vim.api.nvim_create_autocmd({ "VimEnter", "FocusGained" }, {
  group = init_colorscheme,
  desc = "Set the background color based on the system appearance",
  callback = function()
    local bg_color = os.execute(
      "defaults read -g AppleInterfaceStyle &> /dev/null"
    ) == 0 and "dark" or "light"

    helpers.set_option("background", bg_color)
    vim.cmd("colorscheme " .. color_scheme[bg_color])
  end
})

helpers.set_option("termguicolors", true)

