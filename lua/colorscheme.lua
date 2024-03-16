local helpers = require("helpers")

vim.api.nvim_create_autocmd({ "ColorSchemePre", "CursorHold", "FocusGained" }, {
  desc = "Set the background color based on the system appearance",
  callback = function()
    local bg_color = os.execute(
      "defaults read -g AppleInterfaceStyle &> /dev/null"
    ) == 0 and "dark" or "light"

    helpers.set_option("background", bg_color)
  end
})

helpers.set_option("termguicolors", true)

