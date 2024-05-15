local Utils = require("utils")

return {
  "stevearc/oil.nvim",
  function()
    Utils.set_keymaps({
      {
        "<leader>e",
        "<cmd>Oil<cr>",
        { desc = "Open Oil in parent directory" },
      },
    })
  end
}
