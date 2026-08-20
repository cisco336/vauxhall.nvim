local util   = require("vauxhall.util")
local colors = require("vauxhall.colors")

local M = {}

---@class Highlight
---@field fg string|nil
---@field bg string|nil
---@field sp string|nil
---@field style string|nil|Highlight
---@field link string|nil

---@alias Highlights table<string,Highlight>

---@return Theme
function M.setup()
  local config  = require("vauxhall.config")
  local options = config.options

  ---@class Theme
  ---@field highlights Highlights
  local theme = {
    config = options,
    colors = colors.setup(),
  }

  local is_transparent       = theme.config.transparent
  local bg_float_configured  = is_transparent and theme.colors.none or theme.colors.bg_float

  local c = theme.colors

  theme.highlights = {
    -- Base UI
    Comment      = { fg = c.comment, style = options.styles.comments },
    ColorColumn  = { bg = c.black },
    Conceal      = { fg = c.dark5 },
    Cursor       = { fg = c.bg, bg = c.fg },
    lCursor      = { fg = c.bg, bg = c.fg },
    CursorIM     = { fg = c.bg, bg = c.fg },
    CursorColumn = { bg = c.bg_highlight },
    CursorLine   = { bg = c.bg_highlight },
    Directory    = { fg = c.cool_cyan },
    DiffAdd      = { bg = c.diff.add },
    DiffChange   = { bg = c.diff.change },
    DiffDelete   = { bg = c.diff.delete },
    DiffText     = { fg = c.fg, bg = util.darken(c.violet, 0.4) },
    EndOfBuffer  = { fg = c.bg },
    ErrorMsg     = { fg = c.red },
    VertSplit    = { fg = c.violet, bold = true },
    WinSeparator = { fg = c.violet, bold = true },
    Folded       = { fg = c.cool_cyan, bg = c.fg_gutter },
    FoldColumn   = { bg = options.transparent and c.none or c.bg, fg = c.comment },
    SignColumn   = { bg = options.transparent and c.none or c.bg, fg = c.fg_gutter },
    SignColumnSB = { bg = c.bg_sidebar, fg = c.fg_gutter },
    Substitute   = { bg = c.red, fg = c.black },
    LineNr       = { fg = c.fg_gutter_light },
    CursorLineNr = { fg = c.mint },
    MatchParen   = { fg = c.orange, bold = true },
    ModeMsg      = { fg = c.fg_dark, bold = true },
    MsgArea      = { fg = c.fg_dark },
    MoreMsg      = { fg = c.cool_cyan },
    NonText      = { fg = c.dark3 },
    Normal       = { fg = c.fg, bg = options.transparent and c.none or c.bg },
    NormalNC     = { fg = c.fg, bg = options.transparent and c.none or options.dim_inactive and c.bg_dark or c.bg },
    NormalSB     = { fg = c.fg_sidebar, bg = c.bg_sidebar },
    NormalFloat  = { fg = c.fg_float, bg = bg_float_configured },
    FloatBorder  = { fg = c.mint, bg = bg_float_configured },
    FloatTitle   = { fg = c.cool_cyan, bg = bg_float_configured },
    Pmenu        = { bg = c.bg, fg = c.fg },
    PmenuSel     = { bg = c.violet, fg = c.fg, bold = true },
    PmenuSbar    = { bg = c.fg_gutter },
    PmenuThumb   = { bg = c.comment },
    Question     = { fg = c.cool_cyan },
    QuickFixLine = { bg = c.bg_visual, bold = true },
    Search       = { bg = c.bg_search, fg = c.fg },
    IncSearch    = { bg = c.orange, fg = c.black },
    CurSearch    = { link = "IncSearch" },
    SpecialKey   = { fg = c.dark3 },
    SpellBad     = { sp = c.red, undercurl = true },
    SpellCap     = { sp = c.orange, undercurl = true },
    SpellLocal   = { sp = c.yellow, undercurl = true },
    SpellRare    = { sp = c.pink, undercurl = true },
    StatusLine   = { fg = c.fg_sidebar, bg = c.bg_statusline },
    StatusLineNC = { fg = c.fg_gutter, bg = c.bg_statusline },
    TabLine      = { bg = c.bg_statusline, fg = c.fg_gutter },
    TabLineFill  = { bg = c.black },
    TabLineSel   = { fg = c.black, bg = c.cool_cyan },
    Title        = { fg = c.cool_cyan, bold = true },
    Visual       = { bg = c.bg_visual },
    VisualNOS    = { bg = c.bg_visual },
    WarningMsg   = { fg = c.orange },
    Whitespace   = { fg = c.fg_gutter },
    WildMenu     = { bg = c.bg_visual },
    WinBar       = { link = "StatusLine" },
    WinBarNC     = { link = "StatusLineNC" },

    -- Syntax
    Constant   = { fg = c.hot_red },
    String     = { fg = c.yellow },
    Character  = { fg = c.orange },
    Boolean    = { fg = c.cool_cyan },
    Float      = { fg = c.orange },
    Identifier = { fg = c.violet, style = options.styles.variables },
    Function   = { fg = c.pink, style = options.styles.functions },
    Statement  = { fg = c.violet },
    Conditional = { fg = c.purple },
    Operator   = { fg = c.cool_cyan },
    Keyword    = { fg = c.light_blue, style = options.styles.keywords },
    Exception  = { fg = c.mint },
    PreProc    = { fg = c.light_blue },
    Include    = { fg = c.mint },
    Macro      = { fg = c.mint },
    PreCondit  = { fg = c.cool_cyan },
    Type       = { fg = c.cool_cyan },
    StorageClass = { fg = c.purple },
    Structure  = { fg = c.yellow },
    Typedef    = { fg = c.yellow },
    Special    = { fg = c.cool_cyan },
    Delimiter  = { link = "Special" },
    Debug      = { fg = c.orange },
    Underlined = { underline = true },
    Bold       = { bold = true, fg = c.fg },
    Italic     = { italic = true, fg = c.fg },
    Error      = { fg = c.red },
    Todo       = { bg = c.mint, fg = c.bg },

    qfLineNr   = { fg = c.dark5 },
    qfFileName = { fg = c.cool_cyan },

    htmlH1 = { fg = c.cool_cyan, bold = true },
    htmlH2 = { fg = c.light_blue, bold = true },

    mkdCodeDelimiter = { bg = c.terminal_black, fg = c.fg },
    mkdCodeStart     = { fg = c.cool_cyan, bold = true },
    mkdCodeEnd       = { fg = c.cool_cyan, bold = true },

    markdownHeadingDelimiter = { fg = c.orange, bold = true },
    markdownCode             = { fg = c.cool_cyan },
    markdownCodeBlock        = { fg = c.cool_cyan },
    markdownH1               = { fg = c.cool_cyan, bold = true },
    markdownH2               = { fg = c.light_blue, bold = true },
    markdownH3               = { fg = c.blue, bold = true },
    markdownH4               = { fg = c.blue_violet, bold = true },
    markdownH5               = { fg = c.violet, bold = true },
    markdownH6               = { fg = c.purple, bold = true },
    markdownLinkText         = { fg = c.cool_cyan, underline = true },

    ["helpCommand"] = { bg = c.terminal_black, fg = c.cool_cyan },

    debugPC         = { bg = c.bg_sidebar },
    debugBreakpoint = { bg = util.darken(c.yellow, 0.1), fg = c.yellow },

    dosIniLabel = { link = "@property" },

    -- LSP
    LspReferenceText  = { bg = c.fg_gutter },
    LspReferenceRead  = { bg = c.fg_gutter },
    LspReferenceWrite = { bg = c.fg_gutter },

    DiagnosticError       = { fg = c.red },
    DiagnosticWarn        = { fg = c.orange },
    DiagnosticInfo        = { fg = c.light_blue },
    DiagnosticHint        = { fg = c.dark_green },
    DiagnosticUnnecessary = { fg = c.dark_green },

    DiagnosticVirtualTextError = { bg = util.darken(c.red, 0.1), fg = c.red },
    DiagnosticVirtualTextWarn  = { bg = util.darken(c.orange, 0.1), fg = c.orange },
    DiagnosticVirtualTextInfo  = { bg = util.darken(c.light_blue, 0.1), fg = c.light_blue },
    DiagnosticVirtualTextHint  = { bg = util.darken(c.dark_green, 0.1), fg = c.dark_green },

    DiagnosticUnderlineError = { undercurl = true, sp = c.red },
    DiagnosticUnderlineWarn  = { undercurl = true, sp = c.orange },
    DiagnosticUnderlineInfo  = { undercurl = true, sp = c.light_blue },
    DiagnosticUnderlineHint  = { undercurl = true, sp = c.dark_green },

    LspSignatureActiveParameter = { bg = util.darken(c.bg_visual, 0.4), bold = true },
    LspCodeLens  = { fg = c.comment },
    LspInlayHint = { bg = util.darken(c.cool_cyan, 0.1), fg = c.dark3 },
    LspInfoBorder = { fg = c.border_highlight, bg = bg_float_configured },

    -- Tree-sitter
    ["@annotation"]               = { link = "PreProc" },
    ["@attribute"]                = { link = "PreProc" },
    ["@boolean"]                  = { link = "Boolean" },
    ["@character"]                = { link = "Character" },
    ["@character.special"]        = { link = "SpecialChar" },
    ["@comment"]                  = { link = "Comment" },
    ["@keyword.conditional"]      = { link = "Conditional" },
    ["@constant"]                 = { link = "Constant" },
    ["@constant.builtin"]         = { link = "Special" },
    ["@constant.macro"]           = { link = "Define" },
    ["@keyword.debug"]            = { link = "Debug" },
    ["@keyword.directive.define"] = { link = "Define" },
    ["@keyword.exception"]        = { link = "Exception" },
    ["@number.float"]             = { link = "Float" },
    ["@function"]                 = { link = "Function" },
    ["@function.builtin"]         = { link = "Special" },
    ["@function.call"]            = { link = "@function" },
    ["@function.macro"]           = { link = "Macro" },
    ["@keyword.import"]           = { link = "Include" },
    ["@keyword.coroutine"]        = { link = "@keyword" },
    ["@keyword.operator"]         = { link = "@operator" },
    ["@keyword.return"]           = { link = "@keyword" },
    ["@function.method"]          = { link = "Function" },
    ["@function.method.call"]     = { link = "@function.method" },
    ["@namespace.builtin"]        = { link = "@variable.builtin" },
    ["@none"]                     = {},
    ["@number"]                   = { link = "Number" },
    ["@keyword.directive"]        = { link = "PreProc" },
    ["@keyword.repeat"]           = { link = "Repeat" },
    ["@keyword.storage"]          = { link = "StorageClass" },
    ["@string"]                   = { link = "String" },
    ["@markup.link.label"]        = { link = "SpecialChar" },
    ["@markup.link.label.symbol"] = { link = "Identifier" },
    ["@tag"]                      = { link = "Label" },
    ["@tag.attribute"]            = { link = "@property" },
    ["@tag.delimiter"]            = { link = "Delimiter" },
    ["@markup"]                   = { link = "@none" },
    ["@markup.environment"]       = { link = "Macro" },
    ["@markup.environment.name"]  = { link = "Type" },
    ["@markup.raw"]               = { link = "String" },
    ["@markup.math"]              = { link = "Special" },
    ["@markup.strong"]            = { bold = true },
    ["@markup.emphasis"]          = { italic = true },
    ["@markup.strikethrough"]     = { strikethrough = true },
    ["@markup.underline"]         = { underline = true },
    ["@markup.heading"]           = { link = "Title" },
    ["@comment.note"]             = { fg = c.pink },
    ["@comment.error"]            = { fg = c.red },
    ["@comment.hint"]             = { fg = c.pink },
    ["@comment.info"]             = { fg = c.light_blue },
    ["@comment.warning"]          = { fg = c.orange },
    ["@comment.todo"]             = { fg = c.todo },
    ["@markup.link.url"]          = { link = "Underlined" },
    ["@type"]                     = { link = "Type" },
    ["@type.definition"]          = { link = "Typedef" },
    ["@type.qualifier"]           = { link = "@keyword" },
    ["@operator"]                 = { fg = c.cool_cyan },
    ["@punctuation.delimiter"]    = { fg = c.cool_cyan },
    ["@punctuation.bracket"]      = { fg = c.fg_dark },
    ["@punctuation.special"]      = { fg = c.cool_cyan },
    ["@markup.list"]              = { fg = c.cool_cyan },
    ["@markup.list.markdown"]     = { fg = c.orange, bold = true },
    ["@string.documentation"]     = { fg = c.yellow },
    ["@string.html"]              = { fg = c.light_blue },
    ["@string.regexp"]            = { fg = c.cool_cyan },
    ["@string.escape"]            = { fg = c.violet },
    ["@constructor"]              = { fg = c.violet },
    ["@variable.parameter"]       = { fg = c.purple },
    ["@variable.parameter.builtin"] = { fg = util.lighten(c.purple, 0.8) },
    ["@keyword"]                  = { fg = c.mint, style = options.styles.keywords },
    ["@keyword.function"]         = { fg = c.violet, style = options.styles.functions },
    ["@label"]                    = { fg = c.cool_cyan },
    ["@type.builtin"]             = { fg = util.darken(c.cool_cyan, 0.8) },
    ["@variable.member"]          = { fg = c.purple },
    ["@property"]                 = { fg = c.purple },
    ["@variable"]                 = { fg = c.cool_cyan, style = options.styles.variables },
    ["@variable.builtin"]         = { fg = c.hot_red },
    ["@module.builtin"]           = { fg = c.hot_red },
    ["@markup.raw.markdown_inline"] = { bg = c.terminal_black, fg = c.cool_cyan },
    ["@markup.link"]              = { fg = c.cool_cyan },
    ["@markup.list.unchecked"]    = { fg = c.cool_cyan },
    ["@markup.list.checked"]      = { fg = c.violet },
    ["@diff.plus"]                = { link = "DiffAdd" },
    ["@diff.minus"]               = { link = "DiffDelete" },
    ["@diff.delta"]               = { link = "DiffChange" },
    ["@module"]                   = { link = "Include" },

    -- tsx / jsx
    ["@tag.tsx"]           = { fg = c.hot_red },
    ["@constructor.tsx"]   = { fg = c.cool_cyan },
    ["@tag.delimiter.tsx"] = { fg = util.darken(c.cool_cyan, 0.7) },

    -- LSP semantic tokens
    ["@lsp.type.boolean"]        = { link = "@boolean" },
    ["@lsp.type.builtinType"]    = { link = "@type.builtin" },
    ["@lsp.type.comment"]        = { link = "@comment" },
    ["@lsp.type.decorator"]      = { link = "@attribute" },
    ["@lsp.type.deriveHelper"]   = { link = "@attribute" },
    ["@lsp.type.enum"]           = { link = "@type" },
    ["@lsp.type.enumMember"]     = { link = "@constant" },
    ["@lsp.type.escapeSequence"] = { link = "@string.escape" },
    ["@lsp.type.formatSpecifier"] = { link = "@markup.list" },
    ["@lsp.type.generic"]        = { link = "@variable" },
    ["@lsp.type.interface"]      = { fg = util.lighten(c.cool_cyan, 0.7) },
    ["@lsp.type.keyword"]        = { link = "@keyword" },
    ["@lsp.type.lifetime"]       = { link = "@keyword.storage" },
    ["@lsp.type.namespace"]      = { link = "@module" },
    ["@lsp.type.number"]         = { link = "@number" },
    ["@lsp.type.operator"]       = { link = "@operator" },
    ["@lsp.type.parameter"]      = { link = "@variable.parameter" },
    ["@lsp.type.property"]       = { link = "@property" },
    ["@lsp.type.selfKeyword"]    = { link = "@variable.builtin" },
    ["@lsp.type.selfTypeKeyword"] = { link = "@variable.builtin" },
    ["@lsp.type.string"]         = { link = "@string" },
    ["@lsp.type.typeAlias"]      = { link = "@type.definition" },
    ["@lsp.type.unresolvedReference"] = { undercurl = true, sp = c.red },
    ["@lsp.type.variable"]       = {},
    ["@lsp.typemod.class.defaultLibrary"]      = { link = "@type.builtin" },
    ["@lsp.typemod.enum.defaultLibrary"]       = { link = "@type.builtin" },
    ["@lsp.typemod.enumMember.defaultLibrary"] = { link = "@constant.builtin" },
    ["@lsp.typemod.function.defaultLibrary"]   = { link = "@function.builtin" },
    ["@lsp.typemod.keyword.async"]             = { link = "@keyword.coroutine" },
    ["@lsp.typemod.keyword.injected"]          = { link = "@keyword" },
    ["@lsp.typemod.macro.defaultLibrary"]      = { link = "@function.builtin" },
    ["@lsp.typemod.method.defaultLibrary"]     = { link = "@function.builtin" },
    ["@lsp.typemod.operator.injected"]         = { link = "@operator" },
    ["@lsp.typemod.string.injected"]           = { link = "@string" },
    ["@lsp.typemod.struct.defaultLibrary"]     = { link = "@type.builtin" },
    ["@lsp.typemod.type.defaultLibrary"]       = { fg = util.darken(c.cool_cyan, 0.8) },
    ["@lsp.typemod.typeAlias.defaultLibrary"]  = { fg = util.darken(c.cool_cyan, 0.8) },
    ["@lsp.typemod.variable.callable"]         = { link = "@function" },
    ["@lsp.typemod.variable.defaultLibrary"]   = { link = "@variable.builtin" },
    ["@lsp.typemod.variable.injected"]         = { link = "@variable" },
    ["@lsp.typemod.variable.static"]           = { link = "@constant" },
    ["@lsp.type.namespace.python"]             = { link = "@variable" },
    ["@function.builtin.python"]               = { link = "@function" },

    -- Rainbow delimiters
    RainbowDelimiterRed    = { fg = c.hot_red },
    RainbowDelimiterOrange = { fg = c.orange },
    RainbowDelimiterYellow = { fg = c.yellow },
    RainbowDelimiterGreen  = { fg = c.mint },
    RainbowDelimiterBlue   = { fg = c.cool_cyan },
    RainbowDelimiterViolet = { fg = c.violet },
    RainbowDelimiterCyan   = { fg = c.light_blue },

    -- Trouble
    TroubleText   = { fg = c.fg_dark },
    TroubleCount  = { fg = c.violet, bg = c.fg_gutter },
    TroubleNormal = { fg = c.fg, bg = bg_float_configured },

    -- Illuminate
    IlluminatedWordText  = { bg = c.fg_gutter },
    IlluminatedWordRead  = { bg = c.fg_gutter },
    IlluminatedWordWrite = { bg = c.fg_gutter },

    -- Diff
    diffAdded     = { fg = c.git.add },
    diffRemoved   = { fg = c.git.delete },
    diffChanged   = { fg = c.git.change },
    diffOldFile   = { fg = c.yellow },
    diffNewFile   = { fg = c.orange },
    diffFile      = { fg = c.cool_cyan },
    diffLine      = { fg = c.comment },
    diffIndexLine = { fg = c.violet },

    -- Neogit
    NeogitBranch                 = { fg = c.violet },
    NeogitRemote                 = { fg = c.mint },
    NeogitHunkHeader             = { bg = c.bg_highlight, fg = c.fg },
    NeogitHunkHeaderHighlight    = { bg = c.fg_gutter, fg = c.cool_cyan },
    NeogitDiffContextHighlight   = { bg = util.darken(c.fg_gutter, 0.5), fg = c.fg_dark },
    NeogitDiffDeleteHighlight    = { fg = c.git.delete, bg = c.diff.delete },
    NeogitDiffAddHighlight       = { fg = c.git.add, bg = c.diff.add },

    -- GitGutter / GitSigns
    GitGutterAdd          = { fg = c.gitSigns.add },
    GitGutterChange       = { fg = c.gitSigns.change },
    GitGutterDelete       = { fg = c.gitSigns.delete },
    GitGutterAddLineNr    = { fg = c.gitSigns.add },
    GitGutterChangeLineNr = { fg = c.gitSigns.change },
    GitGutterDeleteLineNr = { fg = c.gitSigns.delete },
    GitSignsAdd           = { fg = c.gitSigns.add },
    GitSignsChange        = { fg = c.gitSigns.change },
    GitSignsDelete        = { fg = c.gitSigns.delete },
    MiniDiffSignAdd       = { fg = c.gitSigns.add },
    MiniDiffSignChange    = { fg = c.gitSigns.change },
    MiniDiffSignDelete    = { fg = c.gitSigns.delete },

    -- Telescope
    TelescopeBorder         = { fg = c.mint },
    TelescopePromptBorder   = { fg = c.cool_cyan },
    TelescopeResultsBorder  = { fg = c.mint },
    TelescopePreviewBorder  = { fg = c.mint },
    TelescopeSelection      = { fg = c.fg, bg = c.dark5 },
    TelescopeMultiSelection = { fg = c.mint, bg = c.dark5 },
    TelescopeNormal         = { fg = c.fg, bg = options.transparent and c.none or c.bg },
    TelescopeMatching       = { fg = c.pink },
    TelescopePromptPrefix   = { fg = c.mint },
    TelescopeResultsDiffDelete = { fg = c.red },
    TelescopeResultsDiffChange = { fg = c.cool_cyan },
    TelescopeResultsDiffAdd    = { fg = c.pink },

    -- NvimTree
    NvimTreeNormal         = { fg = c.fg_sidebar, bg = options.transparent and c.none or c.bg_sidebar },
    NvimTreeNormalNC       = { fg = c.fg_sidebar, bg = options.transparent and c.none or c.bg_sidebar },
    NvimTreeWinSeparator   = {
      fg = options.styles.sidebars == "transparent" and c.border or c.bg_sidebar,
      bg = c.bg_sidebar,
    },
    NvimTreeRootFolder     = { fg = c.cool_cyan, bold = true },
    NvimTreeGitDirty       = { fg = c.git.change },
    NvimTreeGitNew         = { fg = c.git.add },
    NvimTreeGitDeleted     = { fg = c.git.delete },
    NvimTreeFolderName     = { fg = c.fg_sidebar },
    NvimTreeOpenedFolderName = { fg = c.fg_sidebar },
    NvimTreeEmptyFolderName = { fg = c.comment },
    NvimTreeOpenedFile     = { bg = c.bg_highlight },
    NvimTreeSpecialFile    = { fg = c.mint, underline = true },
    NvimTreeIndentMarker   = { fg = c.fg_gutter },
    NvimTreeImageFile      = { fg = c.fg_sidebar },
    NvimTreeSymlink        = { fg = c.cool_cyan },
    NvimTreeFolderIcon     = { bg = c.none, fg = c.cool_cyan },

    NeoTreeNormal    = { fg = c.fg_sidebar, bg = options.transparent and c.none or c.bg_sidebar },
    NeoTreeNormalNC  = { fg = c.fg_sidebar, bg = options.transparent and c.none or c.bg_sidebar },
    NeoTreeDimText   = { fg = c.fg_gutter },
    NeoTreeTitleBar  = { link = "NeoTreeNormalNC" },
    NeoTreeFloatBorder = { link = "NeoTreeNormalNC" },

    -- Dashboard / Alpha
    DashboardShortCut = { fg = c.light_blue },
    DashboardHeader   = { fg = c.mint },
    DashboardCenter   = { fg = c.violet },
    DashboardFooter   = { fg = c.light_blue },
    DashboardKey      = { fg = c.purple },
    DashboardDesc     = { fg = c.cool_cyan },
    DashboardIcon     = { fg = c.mint, bold = true },
    AlphaShortcut     = { fg = c.orange },
    AlphaHeader       = { fg = c.cool_cyan },
    AlphaHeaderLabel  = { fg = c.orange },
    AlphaFooter       = { fg = c.cool_cyan },
    AlphaButtons      = { fg = c.light_blue },

    -- WhichKey
    WhichKey         = { fg = c.light_blue },
    WhichKeyGroup    = { fg = c.cool_cyan },
    WhichKeyDesc     = { fg = c.mint },
    WhichKeySeparator = { fg = c.comment },
    WhichKeySeperator = { fg = c.comment },
    WhichKeyFloat    = { bg = bg_float_configured },
    WhichKeyValue    = { fg = c.dark5 },
    WhichKeyBorder   = { fg = c.cool_cyan },

    -- Cmp
    CmpDocumentation         = { fg = c.fg, bg = bg_float_configured },
    CmpDocumentationBorder   = { fg = c.border_highlight, bg = bg_float_configured },
    CmpGhostText             = { fg = c.terminal_black },
    CmpItemAbbr              = { fg = c.fg, bg = c.none },
    CmpItemAbbrDeprecated    = { fg = c.fg_gutter, bg = c.none, strikethrough = true },
    CmpItemAbbrMatch         = { fg = c.cool_cyan, bg = c.none },
    CmpItemAbbrMatchFuzzy    = { fg = c.cool_cyan, bg = c.none },
    CmpItemMenu              = { fg = c.comment, bg = c.none },
    CmpItemKindDefault       = { fg = c.fg_dark, bg = c.none },
    CmpItemKindCopilot       = { fg = c.cool_cyan, bg = c.none },

    -- blink.nvim
    BlinkCmpDoc           = { fg = c.fg, bg = c.bg_highlight },
    BlinkCmpDocBorder     = { fg = c.mint, bg = c.bg_float },
    BlinkCmpGhostText     = { fg = c.fg_gutter_light },
    BlinkCmpKind          = { fg = c.cool_cyan, bg = c.none },
    BlinkCmpLabel         = { fg = c.fg, bg = c.none },
    BlinkCmpLabelDeprecated = { fg = c.fg_gutter, bg = c.none, strikethrough = true },
    BlinkCmpLabelMatch    = { fg = c.cyan, bg = c.none },
    BlinkCmpMenu          = { fg = c.fg, bg = c.bg_highlight },
    BlinkCmpMenuBorder    = { fg = c.mint, bg = c.bg_highlight },
    BlinkCmpScrollBarThumb = { fg = c.bg_highlight, bg = c.cool_cyan },

    -- fzf-lua
    FzfLuaNormal     = { fg = c.fg, bg = bg_float_configured },
    FzfLuaBorder     = { fg = c.mint, bg = bg_float_configured },
    FzfLuaSearch     = { fg = c.fg, bg = bg_float_configured },
    FzfLuaTitle      = { fg = c.cool_cyan, bg = bg_float_configured },
    FzfLuaCursorLine = { bg = c.bg_highlight, fg = c.mint },
    FzfLuaFzfPrompt  = { bg = bg_float_configured, fg = c.violet },

    -- Indent
    IndentBlanklineChar        = { fg = c.fg_gutter, nocombine = true },
    IndentBlanklineContextChar = { fg = c.mint, nocombine = true },
    IblIndent                  = { fg = c.fg_gutter, nocombine = true },
    IblScope                   = { fg = c.mint, nocombine = true },

    -- Navic
    NavicSeparator = { fg = c.fg, bg = c.none },
    NavicText      = { fg = c.fg, bg = c.none },

    -- Hop / Leap / Flash
    HopNextKey   = { fg = c.pink, bold = true },
    HopNextKey1  = { fg = c.cool_cyan, bold = true },
    HopNextKey2  = { fg = util.darken(c.cool_cyan, 0.6) },
    HopUnmatched = { fg = c.dark3 },
    LeapMatch           = { bg = c.pink, fg = c.fg, bold = true },
    LeapLabelPrimary    = { fg = c.pink, bold = true },
    LeapLabelSecondary  = { fg = c.violet, bold = true },
    LeapBackdrop        = { fg = c.dark3 },
    FlashBackdrop       = { fg = c.dark3 },
    FlashLabel          = { bg = c.mint, bold = true, fg = c.black },
    FlashCurrent        = { bg = c.bg_highlight, bold = true, fg = c.violet },
    FlashMatch          = { bg = c.bg_highlight, bold = true, fg = c.pink },

    -- Scrollbar
    ScrollbarHandle       = { fg = c.none, bg = c.bg_highlight },
    ScrollbarSearchHandle = { fg = c.orange, bg = c.bg_highlight },
    ScrollbarSearch       = { fg = c.orange, bg = c.none },
    ScrollbarErrorHandle  = { fg = c.red, bg = c.bg_highlight },
    ScrollbarError        = { fg = c.red, bg = c.none },
    ScrollbarWarnHandle   = { fg = c.orange, bg = c.bg_highlight },
    ScrollbarWarn         = { fg = c.orange, bg = c.none },
    ScrollbarInfoHandle   = { fg = c.light_blue, bg = c.bg_highlight },
    ScrollbarInfo         = { fg = c.light_blue, bg = c.none },
    ScrollbarHintHandle   = { fg = c.pink, bg = c.bg_highlight },
    ScrollbarHint         = { fg = c.pink, bg = c.none },
    ScrollbarMiscHandle   = { fg = c.mint, bg = c.bg_highlight },
    ScrollbarMisc         = { fg = c.mint, bg = c.none },

    -- Notify
    NotifyBackground   = { fg = c.fg, bg = bg_float_configured },
    NotifyERRORBorder  = { fg = util.darken(c.red, 0.3), bg = options.transparent and c.none or c.bg },
    NotifyWARNBorder   = { fg = util.darken(c.orange, 0.3), bg = options.transparent and c.none or c.bg },
    NotifyINFOBorder   = { fg = util.darken(c.light_blue, 0.3), bg = options.transparent and c.none or c.bg },
    NotifyDEBUGBorder  = { fg = util.darken(c.comment, 0.3), bg = options.transparent and c.none or c.bg },
    NotifyTRACEBorder  = { fg = util.darken(c.mint, 0.3), bg = options.transparent and c.none or c.bg },
    NotifyERRORIcon    = { fg = c.red },
    NotifyWARNIcon     = { fg = c.orange },
    NotifyINFOIcon     = { fg = c.light_blue },
    NotifyDEBUGIcon    = { fg = c.comment },
    NotifyTRACEIcon    = { fg = c.mint },
    NotifyERRORTitle   = { fg = c.red },
    NotifyWARNTitle    = { fg = c.orange },
    NotifyINFOTitle    = { fg = c.light_blue },
    NotifyDEBUGTitle   = { fg = c.comment },
    NotifyTRACETitle   = { fg = c.mint },
    NotifyERRORBody    = { fg = c.fg, bg = options.transparent and c.none or c.bg },
    NotifyWARNBody     = { fg = c.fg, bg = options.transparent and c.none or c.bg },
    NotifyINFOBody     = { fg = c.fg, bg = options.transparent and c.none or c.bg },
    NotifyDEBUGBody    = { fg = c.fg, bg = options.transparent and c.none or c.bg },
    NotifyTRACEBody    = { fg = c.fg, bg = options.transparent and c.none or c.bg },

    -- Mini
    MiniCursorword        = { bg = c.fg_gutter },
    MiniCursorwordCurrent = { bg = c.fg_gutter },
    MiniIndentscopeSymbol = { fg = c.cool_cyan, nocombine = true },
    MiniIndentscopePrefix = { nocombine = true },
    MiniJump              = { bg = c.pink, fg = "#ffffff" },
    MiniJump2dSpot        = { fg = c.pink, bold = true, nocombine = true },
    MiniStarterCurrent    = { nocombine = true },
    MiniStarterFooter     = { fg = c.yellow, italic = true },
    MiniStarterHeader     = { fg = c.cool_cyan },
    MiniStarterInactive   = { fg = c.comment, style = options.styles.comments },
    MiniStarterItem       = { fg = c.fg, bg = options.transparent and c.none or c.bg },
    MiniStarterItemBullet = { fg = c.border_highlight },
    MiniStarterItemPrefix = { fg = c.orange },
    MiniStarterSection    = { fg = c.cool_cyan },
    MiniStarterQuery      = { fg = c.yellow },
    MiniStatuslineDevinfo   = { fg = c.fg_dark, bg = c.bg_highlight },
    MiniStatuslineFileinfo  = { fg = c.fg_dark, bg = c.bg_highlight },
    MiniStatuslineFilename  = { fg = c.fg_dark, bg = c.fg_gutter },
    MiniStatuslineInactive  = { fg = c.cool_cyan, bg = c.bg_statusline },
    MiniStatuslineModeCommand = { fg = c.black, bg = c.yellow, bold = true },
    MiniStatuslineModeInsert  = { fg = c.black, bg = c.violet, bold = true },
    MiniStatuslineModeNormal  = { fg = c.black, bg = c.cool_cyan, bold = true },
    MiniStatuslineModeOther   = { fg = c.black, bg = c.cool_cyan, bold = true },
    MiniStatuslineModeReplace = { fg = c.black, bg = c.red, bold = true },
    MiniStatuslineModeVisual  = { fg = c.black, bg = c.pink, bold = true },
    MiniSurround              = { bg = c.orange, fg = c.black },
    MiniTablineCurrent         = { fg = c.fg, bg = c.fg_gutter },
    MiniTablineFill            = { bg = c.black },
    MiniTablineHidden          = { fg = c.dark5, bg = c.bg_statusline },
    MiniTablineModifiedCurrent = { fg = c.orange, bg = c.fg_gutter },
    MiniTablineModifiedHidden  = { bg = c.bg_statusline, fg = util.darken(c.orange, 0.7) },
    MiniTablineModifiedVisible = { fg = c.orange, bg = c.bg_statusline },
    MiniTablineTabpagesection  = { bg = c.bg_statusline, fg = c.none },
    MiniTablineVisible         = { fg = c.fg, bg = c.bg_statusline },
    MiniTestFail = { fg = c.red, bold = true },
    MiniTestPass = { fg = c.mint, bold = true },
    MiniTrailspace = { bg = c.red },

    -- Noice
    NoiceCmdline              = { fg = c.mint, bg = bg_float_configured },
    NoiceCmdlineIcon          = { fg = c.mint, bg = bg_float_configured },
    NoiceCmdlinePopupBorder   = { fg = c.mint, bg = bg_float_configured },
    NoiceCmdlinePopupTitle    = { fg = c.mint, bg = bg_float_configured },
    NoiceCmdlinePopupBorderFilter = { fg = c.pink, bg = bg_float_configured },
    NoiceCmdlineIconFilter    = { fg = c.pink, bg = bg_float_configured },
    NoiceCmdlinePopupBorderLua = { fg = c.light_blue },
    NoiceCmdlineIconLua       = { fg = c.light_blue },
    NoiceCmdlinePopupBorderHelp = { fg = c.yellow },
    NoiceCmdlineIconHelp      = { fg = c.yellow },
    NoiceLspProgressSpinner   = { fg = c.cool_cyan },
    NoiceLspProgressTitle     = { fg = c.mint },
    NoiceLspProgressClient    = { fg = c.violet },
    NoiceMini                 = { bg = c.bg_highlight },

    -- DAP UI
    DapUIPlayPause  = { fg = c.violet },
    DapUIRestart    = { fg = c.mint },
    DapUIStop       = { fg = c.red },
    DapUIStepOver   = { fg = c.cool_cyan },
    DapUIStepInto   = { fg = c.cool_cyan },
    DapUIStepOut    = { fg = c.cool_cyan },
    DapUIStepBack   = { fg = c.cool_cyan },
    DapUIType       = { fg = c.cool_cyan },
    DapUIScope      = { fg = c.violet },
    DapUIModifiedValue = { fg = c.violet, bold = true },
    DapUIDecoration = { fg = c.violet },
    DapUIThread     = { fg = c.purple },
    DapUIStoppedThread = { fg = c.violet },
    DapUISource     = { fg = c.cool_cyan },
    DapUILineNumber = { fg = c.violet },
    DapUIFloatBorder = { fg = c.mint },
    DapUIWatchesEmpty = { fg = c.violet },
    DapUIWatchesValue = { fg = c.purple },
    DapUIWatchesError = { fg = c.violet },
    DapUIBreakpointsPath = { fg = c.violet },
    DapUIBreakpointsInfo = { fg = c.purple },
    DapUIBreakpointsCurrentLine = { fg = c.purple, bold = true },
    DapUIWinSelect  = { fg = c.violet, bold = true },
    DapStoppedLine  = { bg = util.darken(c.orange, 0.1) },

    -- Lazy
    LazyProgressDone = { bold = true, fg = c.pink },
    LazyProgressTodo = { bold = true, fg = c.fg_gutter },

    -- Health
    healthError   = { fg = c.red },
    healthSuccess = { fg = c.mint },
    healthWarning = { fg = c.orange },

    -- BufferLine / Barbar
    BufferLineIndicatorSelected = { fg = c.git.change },
    BufferCurrent     = { bg = c.bg, fg = c.fg },
    BufferCurrentERROR = { bg = c.bg, fg = c.red },
    BufferCurrentHINT  = { bg = c.bg, fg = c.pink },
    BufferCurrentINFO  = { bg = c.bg, fg = c.light_blue },
    BufferCurrentWARN  = { bg = c.bg, fg = c.orange },
    BufferCurrentIndex = { bg = c.bg, fg = c.yellow },
    BufferCurrentMod   = { bg = c.bg, fg = c.orange },
    BufferCurrentSign  = { bg = c.bg, fg = c.bg },
    BufferCurrentTarget = { bg = c.bg, fg = c.red },
    BufferVisible     = { bg = c.bg_statusline, fg = c.fg },
    BufferVisibleERROR = { bg = c.bg_statusline, fg = c.red },
    BufferVisibleHINT  = { bg = c.bg_statusline, fg = c.pink },
    BufferVisibleINFO  = { bg = c.bg_statusline, fg = c.light_blue },
    BufferVisibleWARN  = { bg = c.bg_statusline, fg = c.orange },
    BufferInactive    = { bg = util.darken(c.bg_highlight, 0.4), fg = util.darken(c.dark5, 0.8) },
    BufferInactiveERROR = { bg = util.darken(c.bg_highlight, 0.4), fg = util.darken(c.red, 0.8) },
    BufferInactiveHINT  = { bg = util.darken(c.bg_highlight, 0.4), fg = util.darken(c.pink, 0.8) },
    BufferInactiveWARN  = { bg = util.darken(c.bg_highlight, 0.4), fg = util.darken(c.orange, 0.8) },

    TreesitterContext = { bg = util.darken(c.fg_gutter, 0.8) },
    Hlargs           = { fg = c.yellow },

    CodeBlock = { bg = c.bg_highlight },
    AerialNormal = { fg = c.fg, bg = c.none },
    AerialGuide  = { fg = c.fg_gutter },
    AerialLine   = { link = "LspInlayHint" },

    YankyPut    = { link = "IncSearch" },
    YankyYanked = { link = "IncSearch" },
  }

  -- LSP kind highlights
  local kinds = {
    Array = "@punctuation.bracket", Boolean = "@boolean", Class = "@type",
    Color = "Special", Constant = "@constant", Constructor = "@constructor",
    Enum = "@lsp.type.enum", EnumMember = "@lsp.type.enumMember", Event = "Special",
    Field = "@variable.member", File = "Normal", Folder = "Directory",
    Function = "@function", Interface = "@lsp.type.interface", Key = "@variable.member",
    Keyword = "@lsp.type.keyword", Method = "@function.method", Module = "@module",
    Namespace = "@module", Null = "@constant.builtin", Number = "@number",
    Object = "@constant", Operator = "@operator", Package = "@module",
    Property = "@property", Reference = "@markup.link", Snippet = "Conceal",
    String = "@string", Struct = "@lsp.type.struct", Unit = "@lsp.type.struct",
    Text = "@markup", TypeParameter = "@lsp.type.typeParameter", Variable = "@variable",
    Value = "@string",
  }
  local kind_groups = { "NavicIcons%s", "Aerial%sIcon", "CmpItemKind%s", "NoiceCompletionItemKind%s" }
  for kind, link in pairs(kinds) do
    local base = "LspKind" .. kind
    theme.highlights[base] = { link = link }
    for _, plugin in pairs(kind_groups) do
      theme.highlights[plugin:format(kind)] = { link = base }
    end
  end

  -- Markdown rainbow headers (cyan→purple gradient from Vauxhall)
  local markdown_rainbow = {
    c.cool_cyan, c.light_blue, c.blue, c.blue_violet, c.violet, c.purple,
  }
  for i, color in ipairs(markdown_rainbow) do
    theme.highlights["@markup.heading." .. i .. ".markdown"] = { fg = color, bold = true }
    theme.highlights["Headline" .. i] = { bg = util.darken(color, 0.05) }
  end
  theme.highlights["Headline"] = { link = "Headline1" }

  ---@type table<string, table>
  theme.defer = {}

  if options.hide_inactive_statusline then
    local inactive = { underline = true, bg = c.none, fg = c.bg, sp = c.border }
    theme.highlights.StatusLineNC = inactive
    for _, section in ipairs({ "a", "b", "c" }) do
      theme.defer["lualine_" .. section .. "_inactive"] = inactive
    end
    theme.highlights.MiniStatuslineInactive = inactive
  end

  options.on_highlights(theme.highlights, theme.colors)

  if options.transparent then
    theme.highlights.NotifyBackground = { bg = "#000000" }
  end

  return theme
end

return M
