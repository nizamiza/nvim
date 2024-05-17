return {
  {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim"
  },
  function()
    require("telescope").setup({
      defaults = {
        layout_strategy = "vertical",
      },
    })

    require("utils").register_keymaps({
      f = {
        name = "file",
        p = { "<cmd>Telescope find_files<cr>", "Find file" },
        o = { "<cmd>Telescope oldfiles<cr>", "Recently opened" },
        r = { "<cmd>Telescope resume<cr>", "Resume last search" },
      },
      b = {
        name = "buffer",
        l = { "<cmd>Telescope buffers<cr>", "List buffers" },
      },
      g = {
        name = "git",
        i = { "<cmd>Telescope git_status<cr>", "Git status" },
        c = { "<cmd>Telescope git_commits<cr>", "Git commits" },
        b = { "<cmd>Telescope git_branches<cr>", "Git branches" },
        s = { "<cmd>Telescope git_stash<cr>", "Git stash" },
      },
      h = {
        name = "help",
        t = { "<cmd>Telescope help_tags<cr>", "Help tags" },
        c = { "<cmd>Telescope commands<cr>", "Commands" },
      },
      s = {
        name = "search",
        b = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Search buffer" },
        h = { "<cmd>Telescope command_history<cr>", "Command history" },
        m = { "<cmd>Telescope marks<cr>", "Marks" },
        r = { "<cmd>Telescope registers<cr>", "Registers" },
        s = { "<cmd>Telescope search_history<cr>", "Search history" },
        g = { "<cmd>Telescope live_grep<cr>", "Grep string" },
      },
    }, { prefix = "<leader>" })
  end
}
