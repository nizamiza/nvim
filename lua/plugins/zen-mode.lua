local Utils = require("utils")

return {
  "folke/zen-mode.nvim",
  function()
    Utils.set_keymap(
      "<leader>z",
      "<cmd>ZenMode<cr>",
      { desc = "Toggle zen mode" }
    )
  end
}
