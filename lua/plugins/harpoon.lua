local utils = require("utils")

return {
  "ThePrimeagen/harpoon",
  function()
    local harpoon_ui = require("harpoon.ui")
    local harpoon_mark = require("harpoon.mark")

    utils.set_keymaps({
      {
        "<leader>hl",
        function()
          harpoon_ui.toggle_quick_menu()
        end,
        { desc = "Toggle Harpoon menu" }
      },
      {
        "<leader>ha",
        function()
          harpoon_mark.add_file()
        end,
        { desc = "Harpoon the current file" }
      },
      {
        "<leader>hp",
        function()
          harpoon_ui.nav_prev()
        end,
        { desc = "Navigate to previous Harpoon mark" }
      },
      {
        "<leader>hn",
        function()
          harpoon_ui.nav_next()
        end,
        { desc = "Navigate to next Harpoon mark" }
      },
      {
        "<leader>+",
        function()
          harpoon_ui.nav_file(1)
        end,
        { desc = "Navigate to Harpoon mark 1" }
      },
      {
        "<leader>ľ",
        function()
          harpoon_ui.nav_file(2)
        end,
        { desc = "Navigate to Harpoon mark 2" }
      },
      {
        "<leader>š",
        function()
          harpoon_ui.nav_file(3)
        end,
        { desc = "Navigate to Harpoon mark 3" }
      }
    })
  end
}
