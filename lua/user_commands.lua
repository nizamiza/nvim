local ColorScheme = require("colorscheme")

local function change_statusline_colorscheme(opts)
  local wday = opts.fargs[1]
  local bg_color = opts.fargs[2]

  ColorScheme.set_statusline_colorscheme(wday, bg_color)
end

local function delete_other_buffers(opts)
  local initial_force = opts.fargs[1] == "force"
  local force = initial_force
  local current_buf = vim.api.nvim_get_current_buf()

  local count = 0
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if buf == current_buf then
      goto continue
    end

    local bufname = vim.api.nvim_buf_get_name(buf)
    local unsaved_changes = vim.api.nvim_buf_get_option(buf, "modified")

    if unsaved_changes and not force then
      local choice = vim.fn.confirm(
        "Buffer " .. bufname .. " has unsaved changes, what would you like to do?",
        "&Write and delete\n&Cancel\n&Skip\n&Force delete",
        4
      )

      if choice == 1 then
        vim.api.nvim_command("buffer " .. buf)
        vim.api.nvim_command("write")
        vim.api.nvim_command("buffer " .. current_buf)
      elseif choice == 2 then
        return
      elseif choice == 3 then
        goto continue
      elseif choice == 4 then
        force = true
      end
    end

    vim.api.nvim_buf_delete(buf, { force = force })
    count = count + 1

    force = initial_force

    ::continue::
  end

  print("Deleted " .. count .. " buffers.")
end

vim.api.nvim_create_user_command(
  "DeleteOtherBuffers",
  delete_other_buffers,
  {
    nargs = "?",
    desc = "Delete all buffers except the current one",
    complete = function()
      return { "force" }
    end
  }
)

vim.api.nvim_create_user_command(
  "StatuslineColorscheme",
  change_statusline_colorscheme,
  {
    nargs = "+",
    desc = "Change the statusline colorscheme",
    complete = function(_, cmd_line)
      local args = vim.fn.split(cmd_line, " ")

      if #args == 2 then
        return { "dark", "light" }
      end

      return ColorScheme.weekdays
    end
  }
)
