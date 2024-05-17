local M = {}

---@param key string
---@param value any
function M.set_option(key, value)
  vim.opt[key] = value
end

---@param options table<string, any>
function M.set_options(options)
  for key, value in pairs(options) do
    M.set_option(key, value)
  end
end

---@param key string
---@param value any
function M.set_global_option(key, value)
  vim.g[key] = value
end

---@param keymaps table<string, any>b
---@param opts? table<string, string>
function M.register_keymaps(keymaps, opts)
  require("which-key").register(keymaps, opts)
end

return M
