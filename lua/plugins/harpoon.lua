local helpers = require("helpers")

return {
  "ThePrimeagen/harpoon",
  function()
    local harpoon_ui = require("harpoon.ui")
    local harpoon_mark = require("harpoon.mark")

    helpers.set_keymap(
      "<leader>hl",
      function()
        harpoon_ui.toggle_quick_menu()
      end,
      { desc = "Toggle Harpoon menu" }
    )

    helpers.set_keymap(
      "<leader>ha",
      function()
        harpoon_mark.add_file()
      end,
      { desc = "Harpoon the current file" }
    )

    helpers.set_keymap(
      "<leader>hp",
      function()
        harpoon_ui.nav_prev()
      end,
      { desc = "Navigate to previous Harpoon mark" }
    )

    helpers.set_keymap(
      "<leader>hn",
      function()
        harpoon_ui.nav_next()
      end,
      { desc = "Navigate to next Harpoon mark" }
    )

    for index, key in ipairs({"+", "ľ", "š"}) do
      helpers.set_keymap(
        "<leader>" .. key,
        function()
          harpoon_ui.nav_file(index)
        end,
        { desc = "Navigate to Harpoon mark " .. index }
      )
    end
  end
}
