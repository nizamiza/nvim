return {
  {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim"
  },
  function()
    local helpers = require("helpers")
    local builtin = require("telescope.builtin")

    require("telescope").setup({
      defaults = {
        layout_strategy = "vertical",
      },
    })

    helpers.set_keymap("<leader>f", builtin.find_files, { desc = "Find files" })
    helpers.set_keymap("<leader>g", builtin.live_grep, { desc = "Live grep" })
    helpers.set_keymap("<leader>b", builtin.buffers, { desc = "Buffers" })
    helpers.set_keymap("<leader>h", builtin.help_tags, { desc = "Help tags" })
    helpers.set_keymap("<leader>o", builtin.oldfiles, { desc = "Old files" })
    helpers.set_keymap("<leader>i", builtin.git_status, { desc = "Git status" })
    helpers.set_keymap("<leader>m", builtin.git_commits, { desc = "Git commits" })
  end
}
