local helpers = require("helpers")

local color_scheme = {
  dark = "github_dark_high_contrast",
  light = "github_light_high_contrast"
}

local init_colorscheme = vim.api.nvim_create_augroup("init_colorscheme", {})
local adaptive_colorscheme = vim.g.adaptive_colorscheme

local function set_colorscheme(bg_color)
  bg_color = bg_color or vim.o.background

  helpers.set_option("background", bg_color)
  vim.cmd("colorscheme " .. color_scheme[bg_color])
end

vim.api.nvim_create_autocmd({ "VimEnter", "FocusGained" }, {
  group = init_colorscheme,
  desc = "Set the background color based on the system appearance",
  callback = function()
    if not adaptive_colorscheme then
      return
    end

    local bg_color = os.execute(
      "defaults read -g AppleInterfaceStyle &> /dev/null"
    ) == 0 and "dark" or "light"

    set_colorscheme(bg_color)
  end
})

helpers.set_option("termguicolors", true)

if not adaptive_colorscheme then
  set_colorscheme("dark")
end

return {
  set_colorscheme = set_colorscheme
}
