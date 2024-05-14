local Utils = require("utils")

return {
  {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim"
  },
  function()
    local TelescopeBuiltin = require("telescope.builtin")

    require("telescope").setup({
      defaults = {
        layout_strategy = "vertical",
      },
    })

    Utils.set_keymaps({
      {
        "<leader>fp",
        TelescopeBuiltin.find_files,
        { desc = "Find project files" }
      },
      {
        "<leader>lg",
        TelescopeBuiltin.live_grep,
        { desc = "Live grep" }
      },
      {
        "<leader>bl",
        TelescopeBuiltin.buffers,
        { desc = "Buffer list" }
      },
      {
        "<leader>ht",
        TelescopeBuiltin.help_tags,
        { desc = "Help tags" }
      },
      {
        "<leader>sr",
        TelescopeBuiltin.resume,
        { desc = "Resume previous search" }
      },
      {
        "<leader>of",
        TelescopeBuiltin.oldfiles,
        { desc = "Old files" }
      },
      {
        "<leader>gi",
        TelescopeBuiltin.git_status,
        { desc = "Git info" }
      },
      {
        "<leader>gc",
        TelescopeBuiltin.git_commits,
        { desc = "Git commits" }
      }
    })
  end
}
