local colors = require("vauxhall.colors").setup()
local config = require("vauxhall.config")

local vauxhall = {}

local function make_section(fg, bg, bold)
  return { fg = fg, bg = bg, gui = bold and "bold" or nil }
end

vauxhall.normal = {
  a = make_section(colors.black, colors.cool_cyan, config.options.lualine_bold),
  b = make_section(colors.fg, colors.bg_highlight),
  c = make_section(colors.fg_dark, colors.bg_statusline),
}

vauxhall.insert = {
  a = make_section(colors.black, colors.mint, config.options.lualine_bold),
  b = make_section(colors.fg, colors.bg_highlight),
}

vauxhall.command = {
  a = make_section(colors.black, colors.yellow, config.options.lualine_bold),
  b = make_section(colors.fg, colors.bg_highlight),
}

vauxhall.visual = {
  a = make_section(colors.black, colors.pink, config.options.lualine_bold),
  b = make_section(colors.fg, colors.bg_highlight),
}

vauxhall.replace = {
  a = make_section(colors.black, colors.red, config.options.lualine_bold),
  b = make_section(colors.fg, colors.bg_highlight),
}

vauxhall.terminal = {
  a = make_section(colors.black, colors.violet, config.options.lualine_bold),
  b = make_section(colors.fg, colors.bg_highlight),
}

vauxhall.inactive = {
  a = make_section(colors.fg_dark, colors.bg_statusline),
  b = make_section(colors.fg_dark, colors.bg_statusline),
  c = make_section(colors.fg_dark, colors.bg_statusline),
}

return vauxhall
