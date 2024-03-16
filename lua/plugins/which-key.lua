return {
  "folke/which-key.nvim",
  function()
    local helpers = require("helpers") 

    helpers.set_option("timeout", true);
    helpers.set_option("timeoutlen", 500)

    require("which-key").setup()
  end
}
