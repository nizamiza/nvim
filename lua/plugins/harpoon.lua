local Utils = require("utils")

return {
  "ThePrimeagen/harpoon",
  function()
    local HarpoonUI = require("harpoon.ui")
    local HarpoonMark = require("harpoon.mark")

    Utils.set_keymaps({
      {
        "<leader>hl",
        function()
          HarpoonUI.toggle_quick_menu()
        end,
        { desc = "Toggle Harpoon menu" }
      },
      {
        "<leader>ha",
        function()
          HarpoonMark.add_file()
        end,
        { desc = "Harpoon the current file" }
      },
      {
        "<leader>hp",
        function()
          HarpoonUI.nav_prev()
        end,
        { desc = "Navigate to previous Harpoon mark" }
      },
      {
        "<leader>hn",
        function()
          HarpoonUI.nav_next()
        end,
        { desc = "Navigate to next Harpoon mark" }
      },
      {
        "<leader>+",
        function()
          HarpoonUI.nav_file(1)
        end,
        { desc = "Navigate to Harpoon mark 1" }
      },
      {
        "<leader>ľ",
        function()
          HarpoonUI.nav_file(2)
        end,
        { desc = "Navigate to Harpoon mark 2" }
      },
      {
        "<leader>š",
        function()
          HarpoonUI.nav_file(3)
        end,
        { desc = "Navigate to Harpoon mark 3" }
      }
    })
  end
}
