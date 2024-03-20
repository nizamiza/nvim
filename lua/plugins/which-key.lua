local helpers = require("helpers") 

return {
  "folke/which-key.nvim",
  function()

    helpers.set_option("timeout", true);
    helpers.set_option("timeoutlen", 500)

    require("which-key").setup()
  end
}
