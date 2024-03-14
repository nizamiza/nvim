local function set_option(key, value)
  vim.opt[key] = value
end

local function set_global_option(key, value)
  vim.g[key] = value
end

local function set_keymap(key, value, opts)
  opts = vim.tbl_extend("force", { noremap = true, silent = true }, opts or {})

  local mode = opts.mode or "n"
  opts.mode = nil

  vim.keymap.set(mode, key, value, opts)
end

return {
  set_option = set_option,
  set_global_option = set_global_option,
  set_keymap = set_keymap
}
