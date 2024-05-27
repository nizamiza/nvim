return {
  "ThePrimeagen/harpoon",
  function()
    local nav_keymaps = {}
    for index, key in ipairs({ "+", "ľ", "š", "č", "ť", "ž", "ý", "á", "í", "é" }) do
      table.insert(nav_keymaps, {
        [key] = {
          "<cmd>lua require('harpoon.ui').nav_file(" .. index .. ")<cr>",
          "Navigate to Harpoon mark " .. index
        }
      })
    end

    require("utils").register_keymaps({
      h = vim.tbl_extend("force", {
        name = "harpoon",
        l = {
          "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>",
          "Toggle Harpoon menu"
        },
        a = {
          "<cmd>lua require('harpoon.mark').add_file()<cr>",
          "Harpoon the current file"
        },
        p = {
          "<cmd>lua require('harpoon.ui').nav_prev()<cr>",
          "Navigate to previous Harpoon mark"
        },
        n = {
          "<cmd>lua require('harpoon.ui').nav_next()<cr>",
          "Navigate to next Harpoon mark"
        },
      }, nav_keymaps)
    }, { prefix = "<leader>" })
  end
}
