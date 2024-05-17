return {
  "folke/flash.nvim",
  function()
    local function flash(cmd)
      return function()
        require("flash")[cmd]()
      end
    end

    require("utils").register_keymaps({
      s = { flash("jump"), "Flash", mode = { "n", "x", "o" } },
      S = { flash("treesitter"), "Flash Treesitter", mode = { "n", "x", "o" } },
      r = { flash("remote"), "Remote Flash", mode = "o" },
      R = { flash("treesitter_search"), "Treesitter search", mode = { "x", "o" } },
      ["<c-s>"] = { flash("toggle"), "Toggle Flash search", mode = "c" },
    })
  end
}
