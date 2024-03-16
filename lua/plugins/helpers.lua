local function get_plugin_version(install_path)
  return vim.fn.system({ "git", "-C", install_path, "describe", "--tags" }):gsub("\n", "")
end

local function get_plugin_info(path_or_name)
  local name = path_or_name:match("([^/]+)$") 
  local install_path = vim.fn.stdpath("config") .. "/pack/plugins/start/" .. name

  local version = get_plugin_version(install_path)

  return {
    install_path = install_path,
    name = name,
    version = version
  }
end

local function is_plugin_installed(path_or_name)
  local info = get_plugin_info(path_or_name)
  return vim.fn.isdirectory(info.install_path) == 1
end

local function fetch_plugin(path_or_name, silent)
  silent = silent or false

  if is_plugin_installed(path_or_name) then
    if not silent then
      print("Plugin " .. path_or_name .. " is already installed.\n")
    end
    return
  end

  local url = path_or_name:match("^http") and path_or_name or "https://github.com/" .. path_or_name
  local info = get_plugin_info(path_or_name)

  print("Cloning " .. url .. " to " .. info.install_path .. "...")

  vim.fn.system({ "git", "clone", url, info.install_path })

  print("Plugin " .. info.name .. " has been installed!")
end 

local function update_plugin(path_or_name)
  if not is_plugin_installed(path_or_name) then
    print("Plugin " .. path_or_name .. " is not installed.")

    local answer = vim.fn.input("Would you like to install it? (y/n): ")

    if answer == "y" then
      print("\n")
      fetch_plugin(path_or_name)
    end

    return
  end

  local info = get_plugin_info(path_or_name)

  print("Updating " .. info.name .. "...")
  vim.fn.system({ "git", "-C", info.install_path, "pull" })

  local new_version = get_plugin_version(info.install_path)

  if info.version == new_version then
    print("Plugin " .. info.name .. " is already up to date.")
    return
  end

  print("Plugin " .. info.name .. " has been updated to " .. new_version .. "!")
end

local function delete_plugin(path_or_name)
  local info = get_plugin_info(path_or_name)

  local answer = vim.fn.input("Are you sure you want to delete " .. info.name .. "? (y/n): ")

  if answer ~= "y" then
    return
  end

  print("\nDeleting " .. info.name .. "...")
  vim.fn.system({ "rm", "-rf", info.install_path })

  print("Plugin " .. info.name .. " has been deleted.")
end

return {
  get_plugin_info = get_plugin_info,
  fetch_plugin = fetch_plugin,
  update_plugin = update_plugin,
  delete_plugin = delete_plugin
}
