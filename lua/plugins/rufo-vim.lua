return {
  "ruby-formatter/rufo-vim",
  function()
    require("utils").set_global_option("rufo_auto_formatting", 1)
  end
}
