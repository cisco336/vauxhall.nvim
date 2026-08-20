local M = {}

---@class Config
local defaults = {
  transparent      = false,
  terminal_colors  = true,
  styles = {
    comments  = { italic = true },
    keywords  = { italic = true },
    functions = {},
    variables = {},
    sidebars  = "normal",
    floats    = "normal",
  },
  sidebars = { "qf", "help" },
  hide_inactive_statusline = false,
  dim_inactive  = false,
  lualine_bold  = true,
  on_colors     = function(_) end,
  on_highlights = function(_, _) end,
}

M.options = {}

function M.setup(options)
  M.options = vim.tbl_deep_extend("force", {}, defaults, options or {})
end

function M.extend(options)
  local base = (type(M.options) == "table" and not vim.tbl_isempty(M.options) and M.options.styles)
    and M.options or defaults
  M.options = vim.tbl_deep_extend("force", {}, base, type(options) == "table" and options or {})
end

return M
