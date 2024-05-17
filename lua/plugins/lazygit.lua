return {
  "kdheepak/lazygit.nvim",
  function()
    require("utils").register_keymaps({
      g = {
        name = "git",
        l = { "<cmd>LazyGit<cr>", "LazyGit" },
      },
    }, { prefix = "<leader>" })
  end
}
