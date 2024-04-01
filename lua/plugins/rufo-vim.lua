return {
  "ruby-formatter/rufo-vim",
  function()
    local helpers = require("helpers")
    helpers.set_global_option("rufo_auto_formatting", 1)
  end
}
