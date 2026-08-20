# vauxhall.nvim

A Neovim colorscheme port of [Vauxhall Obsidian](https://github.com/CyanVoxel/vauxhall-obsidian) by CyanVoxel, structured after [eldritch.nvim](https://github.com/eldritch-theme/eldritch.nvim).

The palette uses Vauxhall's signature deep indigo backgrounds with a cyan-to-purple gradient accent system.

## Palette

| Role           | Color      | Preview |
|----------------|------------|---------|
| Background     | `#0f1129`  | deep indigo |
| Foreground     | `#d8ccff`  | soft lavender-white |
| Mint / Green   | `#52eea3`  | |
| Cyan           | `#51e1e9`  | |
| Cool Cyan      | `#43cfea`  | |
| Light Blue     | `#54b6f8`  | |
| Blue           | `#437cf3`  | |
| Blue Violet    | `#6f51f4`  | |
| Violet         | `#9446f8`  | |
| Purple         | `#c952ed`  | |
| Magenta / Pink | `#e54f9b`  | |
| Hot Red        | `#e3365e`  | |
| Yellow         | `#ffd85e`  | |
| Orange         | `#fa9f50`  | |

## Installation

### lazy.nvim

```lua
{
  "cisco336/vauxhall.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
  config = function(_, opts)
    require("vauxhall").setup(opts)
    vim.cmd.colorscheme("vauxhall")
  end,
}
```

### Configuration

```lua
require("vauxhall").setup({
  transparent = false,
  terminal_colors = true,
  styles = {
    comments  = { italic = true },
    keywords  = { italic = true },
    functions = {},
    variables = {},
    sidebars  = "normal",  -- "dark" | "transparent" | "normal"
    floats    = "normal",  -- "dark" | "transparent" | "normal"
  },
  sidebars = { "qf", "help" },
  lualine_bold = true,
  on_colors = function(colors) end,
  on_highlights = function(highlights, colors) end,
})
```

### Lualine

```lua
require("lualine").setup({ options = { theme = "vauxhall" } })
```

## Credits

### 🎨 Vauxhall Obsidian — Color Palette
[Vauxhall Obsidian](https://github.com/CyanVoxel/vauxhall-obsidian) was created by [CyanVoxel](https://github.com/CyanVoxel).
All colors in this theme — the deep indigo backgrounds, the cyan-to-purple gradient accents, and the semantic highlight palette — are directly derived from their work. This port would not exist without the thoughtful and beautiful design of the original Vauxhall theme.

### 🔧 eldritch.nvim — Plugin Architecture
[eldritch.nvim](https://github.com/eldritch-theme/eldritch.nvim) was created by the [eldritch-theme](https://github.com/eldritch-theme) organization.
The entire plugin structure — including the module layout (`colors`, `config`, `theme`, `util`, `init`), the highlight group organization, the `blend`/`darken`/`lighten` utilities, the lualine integration, and the `on_colors`/`on_highlights` override system — is modeled after their excellent implementation.

Both projects are licensed under the MIT License.
