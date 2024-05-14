local Utils = require("utils")

return {
  "folke/which-key.nvim",
  function()
    Utils.set_option("timeout", true);
    Utils.set_option("timeoutlen", 500)

    require("which-key").setup()
  end
}
