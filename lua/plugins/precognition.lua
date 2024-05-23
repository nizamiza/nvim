return {
  "tris203/precognition.nvim",
  function()
    require("utils").register_keymaps({
      c = {
        t = { "<cmd>lua require('precognition').toggle()<cr>", "Toggle precognition" },
        p = { "<cmd>lua require('precognition').peek()<cr>", "Peek precognition" },
      }
    }, { prefix = "<leader>" })
  end
}
