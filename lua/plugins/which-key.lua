local utils = require("utils")

return {
  "folke/which-key.nvim",
  function()
    utils.set_option("timeout", true);
    utils.set_option("timeoutlen", 500)

    require("which-key").setup()
  end
}
