return {
  "nvimtools/none-ls.nvim",
  function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.prettierd,
        null_ls.builtins.formatting.rufo,
        null_ls.builtins.diagnostics.codespell,
      },
    })
  end
}
