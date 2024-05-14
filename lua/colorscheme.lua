local utils = require("utils")

local M = {}

M.color_scheme = {
  dark = "github_dark",
  light = "github_light",
  statusline = {
    dark = {
      guifg = "black",
      guibg = {
        "palevioletred",
        "coral",
        "khaki",
        "plum",
        "lightsteelblue",
        "tan",
        "cadetblue",
        "goldenrod"
      },
    },
    light = {
      guifg = "white",
      guibg = {
        "rebeccapurple",
        "firebrick",
        "forestgreen",
        "midnightblue",
        "darkolivegreen",
        "navy",
        "darkgreen",
      }
    }
  }
}

M.weekdays = {
  "Sunday",
  "Monday",
  "Tuesday",
  "Wednesday",
  "Thursday",
  "Friday",
  "Saturday"
}

local init_colorscheme = vim.api.nvim_create_augroup("init_colorscheme", {})
local adaptive_colorscheme = vim.g.adaptive_colorscheme

function M.set_statusline_colorscheme(wday, bg_color)
  wday = wday or os.date("*t").wday
  bg_color = bg_color or vim.o.background

  for index, day in ipairs(M.weekdays) do
    if day == wday then
      wday = index
      break
    end
  end

  if type(wday) == "string" then
    return
  end

  local statusline_cs = M.color_scheme.statusline[bg_color]

  local fg = statusline_cs.guifg
  local bg = statusline_cs.guibg[wday]

  vim.cmd("hi StatusLine guifg=" .. fg .. " guibg=" .. bg)
end

function M.set_colorscheme(bg_color)
  bg_color = bg_color or vim.o.background

  utils.set_option("background", bg_color)
  vim.cmd("colorscheme " .. M.color_scheme[bg_color])

  M.set_statusline_colorscheme()
end

vim.api.nvim_create_autocmd({ "VimEnter", "FocusGained" }, {
  group = init_colorscheme,
  desc = "Set the background color based on the system appearance",
  callback = function()
    if not adaptive_colorscheme then
      return
    end

    local bg_color = os.execute(
      "defaults read -g AppleInterfaceStyle &> /dev/null"
    ) == 0 and "dark" or "light"

    M.set_colorscheme(bg_color)
  end
})

utils.set_option("termguicolors", true)

if not adaptive_colorscheme then
  M.set_colorscheme("dark")
end

return M
