return {
  "lukas-reineke/indent-blankline.nvim",
  function()
    require("ibl").setup({
      indent = {
        char = "│",
      }
    })
  end
}
