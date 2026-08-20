local M = {}

M.bg = "#000000"
M.fg = "#ffffff"

local function hexToRgb(c)
  c = string.lower(c)
  return { tonumber(c:sub(2, 3), 16), tonumber(c:sub(4, 5), 16), tonumber(c:sub(6, 7), 16) }
end

function M.blend(foreground, background, alpha)
  alpha = type(alpha) == "string" and (tonumber(alpha, 16) / 0xff) or alpha
  local bg = hexToRgb(background)
  local fg = hexToRgb(foreground)
  local blendChannel = function(i)
    local ret = (alpha * fg[i] + ((1 - alpha) * bg[i]))
    return math.floor(math.min(math.max(0, ret), 255) + 0.5)
  end
  return string.format("#%02x%02x%02x", blendChannel(1), blendChannel(2), blendChannel(3))
end

function M.darken(hex, amount, bg)
  return M.blend(hex, bg or M.bg, amount)
end

function M.lighten(hex, amount, fg)
  return M.blend(hex, fg or M.fg, amount)
end

function M.highlight(group, hl)
  if hl.style then
    if type(hl.style) == "table" then
      hl = vim.tbl_extend("force", hl, hl.style)
    elseif hl.style:lower() ~= "none" then
      for s in string.gmatch(hl.style, "([^,]+)") do
        hl[s] = true
      end
    end
    hl.style = nil
  end
  vim.api.nvim_set_hl(0, group, hl)
end

function M.autocmds(config)
  local group = vim.api.nvim_create_augroup("vauxhall", { clear = true })
  vim.api.nvim_create_autocmd("ColorSchemePre", {
    group = group,
    callback = function()
      vim.api.nvim_del_augroup_by_id(group)
    end,
  })
  local function set_whl()
    local win = vim.api.nvim_get_current_win()
    local whl = vim.split(vim.wo[win].winhighlight, ",")
    vim.list_extend(whl, { "Normal:NormalSB", "SignColumn:SignColumnSB" })
    whl = vim.tbl_filter(function(hl) return hl ~= "" end, whl)
    vim.opt_local.winhighlight = table.concat(whl, ",")
  end
  vim.api.nvim_create_autocmd("FileType", {
    group = group,
    pattern = table.concat(config.sidebars, ","),
    callback = set_whl,
  })
  if vim.tbl_contains(config.sidebars, "terminal") then
    vim.api.nvim_create_autocmd("TermOpen", { group = group, callback = set_whl })
  end
end

function M.syntax(syntax)
  for group, colors in pairs(syntax) do
    M.highlight(group, colors)
  end
end

function M.terminal(colors)
  vim.g.terminal_color_0  = colors.black
  vim.g.terminal_color_8  = colors.terminal_black
  vim.g.terminal_color_7  = colors.fg_dark
  vim.g.terminal_color_15 = colors.fg
  vim.g.terminal_color_1  = colors.red
  vim.g.terminal_color_9  = colors.red
  vim.g.terminal_color_2  = colors.green
  vim.g.terminal_color_10 = colors.green
  vim.g.terminal_color_3  = colors.yellow
  vim.g.terminal_color_11 = colors.yellow
  vim.g.terminal_color_4  = colors.blue
  vim.g.terminal_color_12 = colors.blue
  vim.g.terminal_color_5  = colors.violet
  vim.g.terminal_color_13 = colors.violet
  vim.g.terminal_color_6  = colors.cool_cyan
  vim.g.terminal_color_14 = colors.cool_cyan
end

function M.load(theme)
  if vim.g.colors_name then
    vim.cmd("hi clear")
  end
  vim.o.termguicolors = true
  M.syntax(theme.highlights)
  if theme.config.terminal_colors then
    M.terminal(theme.colors)
  end
  M.autocmds(theme.config)
  vim.defer_fn(function()
    M.syntax(theme.defer)
  end, 100)
end

return M
