local utils = require("utils")

return {
  {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim"
  },
  function()
    local builtin = require("telescope.builtin")

    require("telescope").setup({
      defaults = {
        layout_strategy = "vertical",
      },
    })

    utils.set_keymaps({
      {
        "<leader>fp",
        builtin.find_files,
        { desc = "Find project files" }
      },
      {
        "<leader>lg",
        builtin.live_grep,
        { desc = "Live grep" }
      },
      {
        "<leader>bl",
        builtin.buffers,
        { desc = "Buffer list" }
      },
      {
        "<leader>ht",
        builtin.help_tags,
        { desc = "Help tags" }
      },
      {
        "<leader>sr",
        builtin.resume,
        { desc = "Resume previous search" }
      },
      {
        "<leader>of",
        builtin.oldfiles,
        { desc = "Old files" }
      },
      {
        "<leader>gi",
        builtin.git_status,
        { desc = "Git info" }
      },
      {
        "<leader>gc",
        builtin.git_commits,
        { desc = "Git commits" }
      }
    })
  end
}
