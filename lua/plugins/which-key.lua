return {
  "folke/which-key.nvim",
  function()
    require("utils").set_options({
      timeout = true,
      timeoutlen = 500,
    })

    require("which-key").setup({
      key_labels = {
        ["<leader>"] = "SPC",
        ["<space>"] = "SPC",
        ["<cr>"] = "RET",
        ["+"] = "1",
        ["ľ"] = "2",
        ["š"] = "3",
        ["č"] = "4",
        ["ť"] = "5",
        ["ž"] = "6",
        ["ý"] = "7",
        ["á"] = "8",
        ["í"] = "9",
        ["é"] = "0"
      }
    })
  end
}
