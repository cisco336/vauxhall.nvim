local util = require("vauxhall.util")

local M = {}

---@class Palette
M.default = {
  none = "NONE",

  -- Backgrounds — near-black with a faint indigo tint
  bg_dark      = "#040508",   -- deepest, used for sidebars/popups
  bg           = "#080a14",   -- main background
  bg_highlight = "#0e1020",   -- cursor line / selection base
  terminal_black = "#1e2238",

  -- Foreground: hsl(255, 100%, 80%) ≈ #c99fff blended w/ white → ~#d8ccff
  fg       = "#d8ccff",
  fg_dark  = "#a897e0",
  fg_gutter = "#2e3255",
  fg_gutter_light = "#6b5fa8",

  -- Comment / dark tones
  comment  = "#6b5fa8",
  dark3    = "#4a4280",
  dark5    = "#3d3870",

  -- Accent colors (from Vauxhall CSS dark theme)
  mint       = "#52eea3",
  cyan       = "#51e1e9",
  cool_cyan  = "#43cfea",
  light_blue = "#54b6f8",
  blue       = "#437cf3",
  blue_violet = "#6f51f4",
  violet     = "#9446f8",
  purple     = "#c952ed",
  magenta    = "#e54f9b",
  hot_red    = "#e3365e",
  cool_gray  = "#515768",

  -- Semantic color aliases
  green      = "#52eea3",   -- mint
  bright_green = "#52eea3",
  dark_green = "#2dbd7e",
  yellow     = "#ffd85e",
  orange     = "#fa9f50",
  red        = "#e3365e",   -- hot_red
  bright_red = "#e3365e",
  pink       = "#e54f9b",   -- magenta

  -- Visual / Search
  visual     = "#3d2a5a",
  bg_visual  = "#3d2a5a",

  git = {
    add    = "#52eea3",
    change = "#54b6f8",
    delete = "#e3365e",
  },
  gitSigns = {
    add    = "#52eea3",
    change = "#54b6f8",
    delete = "#e3365e",
  },
}

---@return ColorScheme
function M.setup()
  local config = require("vauxhall.config")

  ---@class ColorScheme: Palette
  local colors = vim.tbl_deep_extend("force", {}, M.default)

  util.bg = colors.bg

  colors.diff = {
    add    = util.darken(colors.green, 0.15),
    delete = util.darken(colors.red, 0.15),
    change = util.darken(colors.light_blue, 0.15),
    text   = colors.cool_cyan,
  }

  colors.git.ignore   = colors.dark3
  colors.black        = util.darken(colors.bg, 0.8, "#000000")
  colors.border_highlight = util.darken(colors.comment, 0.8)
  colors.border       = colors.black

  colors.bg_popup      = colors.bg_dark
  colors.bg_statusline = colors.bg_dark

  colors.bg_sidebar = config.options.styles.sidebars == "transparent" and colors.none
    or config.options.styles.sidebars == "dark" and colors.bg_dark
    or colors.bg

  colors.bg_float = config.options.styles.floats == "transparent" and colors.none
    or config.options.styles.floats == "dark" and colors.bg_dark
    or colors.bg

  colors.bg_visual  = util.darken(colors.violet, 0.3)
  colors.bg_search  = colors.comment
  colors.fg_sidebar = colors.fg_dark
  colors.fg_float   = colors.fg

  colors.error   = colors.red
  colors.todo    = colors.mint
  colors.warning = colors.yellow
  colors.info    = colors.light_blue
  colors.hint    = colors.dark_green

  colors.delta = {
    add    = util.darken(colors.green, 0.45),
    delete = util.darken(colors.red, 0.45),
  }

  config.options.on_colors(colors)

  return colors
end

return M
