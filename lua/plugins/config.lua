local helpers = require("helpers")

-- Prettier
helpers.set_global_option("prettier#autoformat", 1)
helpers.set_global_option("prettier#autoformat_require_pragma", 0)

-- Treesitter
require("nvim-treesitter.configs").setup({
  auto_install = true,
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
  autotag = {
    enable = true,
  },
  context_commentstring = {
    enable = true,
  }
})

-- Telescope
local telescope_builtin = require("telescope.builtin")

helpers.set_keymap("<leader>ff", telescope_builtin.find_files, { desc = "Find files" })
helpers.set_keymap("<leader>fg", telescope_builtin.live_grep, { desc = "Live grep" })
helpers.set_keymap("<leader>fb", telescope_builtin.buffers, { desc = "Buffers" })
helpers.set_keymap("<leader>fh", telescope_builtin.help_tags, { desc = "Help tags" })

-- WhichKey
helpers.set_option("timeout", true);
helpers.set_option("timeoutlen", 500)

require("which-key").setup()
