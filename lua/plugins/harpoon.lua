return {
  "ThePrimeagen/harpoon",
  function()
    require("utils").register_keymaps({
      h = {
        name = "harpoon",
        l = { "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", "Toggle Harpoon menu" },
        a = { "<cmd>lua require('harpoon.mark').add_file()<cr>", "Harpoon the current file" },
        p = { "<cmd>lua require('harpoon.ui').nav_prev()<cr>", "Navigate to previous Harpoon mark" },
        n = { "<cmd>lua require('harpoon.ui').nav_next()<cr>", "Navigate to next Harpoon mark" },
        ["+"] = { "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", "Navigate to Harpoon mark 1" },
        ["ľ"] = { "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", "Navigate to Harpoon mark 2" },
        ["š"] = { "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", "Navigate to Harpoon mark 3" },
      },
    }, { prefix = "<leader>" })
  end
}
