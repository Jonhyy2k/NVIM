-- Show keybindings popup
return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  config = function()
    local which_key = require("which-key")

    which_key.setup({
      preset = "modern",
    })

    -- Document existing key chains using new v3 API
    which_key.add({
      { "<leader>b", group = "Buffer" },
      { "<leader>c", group = "Code" },
      { "<leader>d", group = "Diagnostics" },
      { "<leader>e", group = "Explorer" },
      { "<leader>f", group = "Find" },
      { "<leader>h", group = "Git Hunk" },
      { "<leader>r", group = "Rename" },
      { "<leader>s", group = "Split" },
      { "<leader>t", group = "Tab/Terminal/Toggle" },
    })
  end,
}
