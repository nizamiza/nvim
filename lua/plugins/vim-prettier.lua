return {
  "prettier/vim-prettier",
  function()
    local helpers = require("helpers")

    helpers.set_global_option("prettier#autoformat", 1)
    helpers.set_global_option("prettier#autoformat_require_pragma", 0)
    helpers.set_global_option("prettier#exec_cmd_path", "/opt/homebrew/bin/prettierd")

    helpers.set_keymap("<leader>p", "<cmd>Prettier<cr>", { desc = "Format with Prettier" })
  end
}
