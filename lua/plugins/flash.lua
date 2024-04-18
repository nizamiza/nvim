local helpers = require("helpers")

return {
  "folke/flash.nvim",
  function()
    local flash = require("flash")

    function exec_flash(cmd)
      return function()
        flash[cmd]()
      end
    end

    helpers.set_keymap("s", exec_flash("jump"), {
      mode = { "n", "x", "o" },
      desc = "Flash",
    })

    helpers.set_keymap("S", exec_flash("treesitter"), {
      mode = { "n", "x", "o" },
      desc = "Flash Treesitter",
    })

    helpers.set_keymap("r", exec_flash("remote"), {
      mode = { "o" },
      desc = "Remote Flash",
    })

    helpers.set_keymap("r", exec_flash("treesitter_search"), {
      mode = { "x", "o" },
      desc = "Treesitter search",
    })

    helpers.set_keymap("<c-s>", exec_flash("toggle"), {
      mode = { "c" },
      desc = "Toggle Flash search",
    })
  end
}
