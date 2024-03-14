local helpers = require("helpers")

-- Source: https://www.reddit.com/r/neovim/comments/uz3ofs/heres_a_function_to_grab_the_name_of_the_current/
-- Credit goes to the user: HarmonicAscendant

local init_statusline = vim.api.nvim_create_augroup("init_statusline", {})

vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "FocusGained" }, {
  desc = "git branch",
  callback = function()
    if vim.fn.isdirectory ".git" ~= 0 then
      local branch = vim.fn.system("git branch --show-current | tr -d '\n'")
      vim.g.git_branch_name = "  " .. branch .. " "
    end
  end,
  group = init_statusline,
})

function GetStatusLine()
  return vim.g.git_branch_name .. " %f %r %m %= %y %l/%L %p%% %c"
end

-- Set the statusline
helpers.set_option("statusline", "%{%v:lua.GetStatusLine()%}")
