local helpers = require("helpers")

return {
  "folke/zen-mode.nvim",
  function()
    helpers.set_keymap("<leader>z", "<cmd>ZenMode<cr>", { desc = "Toggle zen mode" })
  end
}
