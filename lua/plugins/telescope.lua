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

    helpers.set_keymap("<leader>fp", builtin.find_files, { desc = "Find project files" })
    helpers.set_keymap("<leader>lg", builtin.live_grep, { desc = "Live grep" })
    helpers.set_keymap("<leader>bl", builtin.buffers, { desc = "Buffer list" })
    helpers.set_keymap("<leader>ht", builtin.help_tags, { desc = "Help tags" })
    helpers.set_keymap("<leader>sr", builtin.resume, { desc = "Resume previous search" })
    helpers.set_keymap("<leader>of", builtin.oldfiles, { desc = "Old files" })
    helpers.set_keymap("<leader>gi", builtin.git_status, { desc = "Git info" })
    helpers.set_keymap("<leader>gc", builtin.git_commits, { desc = "Git commits" })
  end
}
