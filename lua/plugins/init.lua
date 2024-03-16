local helpers = require("plugins.helpers")
local list = require("plugins.list")

local function autocomplete()
  return list
end

local function fetch_plugins()
  for _, path in ipairs(list) do
    helpers.fetch_plugin(path, true)
  end
end

local function update_plugins()
  for _, path in ipairs(list) do
    helpers.update_plugin(path)
  end
end

vim.api.nvim_create_autocmd({ "VimEnter" }, {
  desc = "Fetch plugins",
  callback = function()
    if vim.fn.isdirectory(vim.fn.stdpath("config") .. "/pack/plugins/start") == 0 then
      fetch_plugins()
    end
    require("plugins.config")
  end
})

vim.api.nvim_create_user_command(
  "PluginInstall",
  function(cmd)
    helpers.fetch_plugin(cmd.args)
  end,
  {
    nargs = 1,
    desc = "Install a plugin",
    complete = autocomplete
  }
)

vim.api.nvim_create_user_command(
  "PluginInstallAll",
  function()
    fetch_plugins()
  end,
  { nargs = 0, desc = "Install all plugins" }
)

vim.api.nvim_create_user_command(
  "PluginUpdate",
  function(cmd)
    helpers.update_plugin(cmd.args)
  end,
  {
    nargs = 1,
    desc = "Update a plugin",
    complete = autocomplete
  }
)

vim.api.nvim_create_user_command(
  "PluginUpdateAll",
  function()
    update_plugins()
  end,
  { nargs = 0, desc = "Update all plugins" }
)

vim.api.nvim_create_user_command(
  "PluginDelete",
  function(cmd)
    helpers.delete_plugin(cmd.args)
  end,
  {
    nargs = 1,
    desc = "Delete a plugin",
    complete = autocomplete
  }
)

vim.api.nvim_create_user_command(
  "PluginList",
  function()
    for _, path in ipairs(list) do
      local info = helpers.get_plugin_info(path)
      print(info.name .. " (" .. info.version .. ")")
    end
  end,
  { nargs = 0, desc = "List all plugins" }
)


