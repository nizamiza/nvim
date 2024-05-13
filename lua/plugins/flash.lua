local utils = require("utils")

return {
  "folke/flash.nvim",
  function()
    local flash = require("flash")

    local function exec_flash(cmd)
      return function()
        flash[cmd]()
      end
    end

    utils.set_keymaps({
      {
        "s",
        exec_flash("jump"),
        { mode = { "n", "x", "o" }, desc = "Flash" },
      },
      {
        "S",
        exec_flash("treesitter"),
        { mode = { "n", "x", "o" }, desc = "Flash Treesitter" },
      },
      {
        "r",
        exec_flash("remote"),
        { mode = { "o" }, desc = "Remote Flash" },
      },
      {
        "r",
        exec_flash("treesitter_search"),
        { mode = { "x", "o" }, desc = "Treesitter search" },
      },
      {
        "<c-s>",
        exec_flash("toggle"),
        { mode = { "c" }, desc = "Toggle Flash search" },
      },
    })
  end
}
