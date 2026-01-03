-- Colorscheme configuration
return {
  "folke/tokyonight.nvim",
  priority = 1000, -- Load before other plugins
  config = function()
    require("tokyonight").setup({
      style = "storm", -- storm is darker than night
      transparent = false,
      terminal_colors = true,
      styles = {
        comments = { italic = true },
        keywords = { italic = true },
        functions = {},
        variables = {},
        sidebars = "dark",
        floats = "dark",
      },
      sidebars = { "qf", "help", "terminal", "packer" },
      dim_inactive = true, -- Dim inactive windows
      lualine_bold = true,
      on_colors = function(colors)
        colors.bg = "#1a1b26" -- Darker background
        colors.bg_dark = "#16161e" -- Even darker for sidebars
      end,
      on_highlights = function(hl, c)
        -- Make line numbers more visible
        hl.LineNr = { fg = "#5a7a8c" }
        hl.CursorLineNr = { fg = "#7aa2f7", bold = true }
        hl.SignColumn = { bg = c.bg }
      end,
    })

    -- Load the colorscheme
    vim.cmd([[colorscheme tokyonight]])

    -- Additional line number highlighting
    vim.api.nvim_set_hl(0, "LineNr", { fg = "#5a7a8c" })
    vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#7aa2f7", bold = true })
  end,
}
