local utils = require("utils")

return {
  "folke/zen-mode.nvim",
  function()
    utils.set_keymap(
      "<leader>z",
      "<cmd>ZenMode<cr>",
      { desc = "Toggle zen mode" }
    )
  end
}
