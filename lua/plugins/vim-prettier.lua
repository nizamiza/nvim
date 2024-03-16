return {
  "prettier/vim-prettier",
  function()
    local helpers = require("helpers")

    helpers.set_global_option("prettier#autoformat", 1)
    helpers.set_global_option("prettier#autoformat_require_pragma", 0)
  end
}
