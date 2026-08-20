local util   = require("vauxhall.util")
local theme  = require("vauxhall.theme")
local config = require("vauxhall.config")

local M = {}

function M.load(opts)
  config.extend(type(opts) == "table" and opts or {})
  util.load(theme.setup())
  vim.g.colors_name = "vauxhall"
end

M.setup = config.setup

return M
