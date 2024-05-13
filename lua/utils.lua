local M = {}

function M.set_option(key, value)
  vim.opt[key] = value
end

function M.set_options(options)
  for key, value in pairs(options) do
    M.set_option(key, value)
  end
end

function M.set_global_option(key, value)
  vim.g[key] = value
end

function M.set_keymap(key, value, opts)
  opts = vim.tbl_extend("force", { noremap = true, silent = true }, opts or {})

  local mode = opts.mode or "n"
  opts.mode = nil

  local modes = type(mode) == "table" and mode or { mode }

  for _, m in ipairs(modes) do
    vim.keymap.set(m, key, value, opts)
  end
end

function M.set_keymaps(keymaps)
  for _, keymap in ipairs(keymaps) do
    M.set_keymap(keymap[1], keymap[2], keymap[3])
  end
end

return M
