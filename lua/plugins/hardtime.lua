return {
  "m4xshen/hardtime.nvim",
  function()
    require("utils").register_keymaps({
      t = {
        h = { "<cmd>Hardtime toggle<cr>", "Toggle hardtime" },
        r = { "<cmd>Hardtime report<cr>", "Hardtime report" },
      }
    }, { prefix = "<leader>" })
  end
}
