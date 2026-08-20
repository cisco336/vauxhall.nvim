vim.cmd([[
  hi clear
  if exists("syntax_on")
    syntax reset
  endif
]])

require("vauxhall").load()
