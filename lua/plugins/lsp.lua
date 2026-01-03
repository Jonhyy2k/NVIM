-- LSP Configuration
return {
  -- Mason: LSP server installer
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      })
    end,
  },

  -- Mason LSP Config
  {
    "williamboman/mason-lspconfig.nvim",
    version = "v1.29.0", -- Pin to version compatible with Neovim 0.10
    dependencies = { "williamboman/mason.nvim" },
    lazy = true, -- Will be loaded by nvim-lspconfig
  },

  -- Mason Tool Installer
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    version = "v1.1.2", -- Pin to compatible version
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-tool-installer").setup({
        ensure_installed = {
          "prettier",
          "stylua",
          "isort",
          "black",
          "pylint",
          "eslint_d",
        },
        integrations = {
          ["mason-lspconfig"] = false, -- Disable integration to avoid compatibility issues
        },
      })
    end,
  },

  -- LSP Config
  {
    "neovim/nvim-lspconfig",
    version = "v0.1.8", -- Pin to version compatible with Neovim 0.10
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "williamboman/mason-lspconfig.nvim",
      { "antosha417/nvim-lsp-file-operations", config = true },
      { "folke/neodev.nvim", opts = {} },
    },
    config = function()
      local lspconfig = require("lspconfig")
      local mason_lspconfig = require("mason-lspconfig")
      local cmp_nvim_lsp = require("cmp_nvim_lsp")
      local keymap = vim.keymap.set

      -- Enable keybinds only for when LSP server available
      local on_attach = function(client, bufnr)
        local opts = { noremap = true, silent = true, buffer = bufnr }

        -- LSP keybinds
        opts.desc = "Show LSP references"
        keymap("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)

        opts.desc = "Go to declaration"
        keymap("n", "gD", vim.lsp.buf.declaration, opts)

        opts.desc = "Show LSP definitions"
        keymap("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)

        opts.desc = "Show LSP implementations"
        keymap("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

        opts.desc = "Show LSP type definitions"
        keymap("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

        opts.desc = "See available code actions"
        keymap({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

        opts.desc = "Smart rename"
        keymap("n", "<leader>rn", vim.lsp.buf.rename, opts)

        opts.desc = "Show buffer diagnostics"
        keymap("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

        opts.desc = "Show line diagnostics"
        keymap("n", "<leader>d", vim.diagnostic.open_float, opts)

        opts.desc = "Go to previous diagnostic"
        keymap("n", "[d", vim.diagnostic.goto_prev, opts)

        opts.desc = "Go to next diagnostic"
        keymap("n", "]d", vim.diagnostic.goto_next, opts)

        opts.desc = "Show documentation for what is under cursor"
        keymap("n", "K", vim.lsp.buf.hover, opts)

        opts.desc = "Restart LSP"
        keymap("n", "<leader>rs", ":LspRestart<CR>", opts)
      end

      -- Used to enable autocompletion
      local capabilities = cmp_nvim_lsp.default_capabilities()

      -- Configure diagnostic signs
      local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
      end

      -- Setup mason-lspconfig first
      mason_lspconfig.setup({
        ensure_installed = {
          "lua_ls",
          "pyright",
          "tsserver",
          "html",
          "cssls",
          "jsonls",
          "clangd",
          "rust_analyzer",
          "gopls",
        },
      })

      -- Setup handlers for mason-lspconfig
      mason_lspconfig.setup_handlers({
        -- Default handler
        function(server_name)
          lspconfig[server_name].setup({
            capabilities = capabilities,
            on_attach = on_attach,
          })
        end,
        -- Custom handler for lua_ls
        ["lua_ls"] = function()
          lspconfig.lua_ls.setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = {
              Lua = {
                diagnostics = {
                  globals = { "vim" },
                },
                workspace = {
                  library = {
                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                    [vim.fn.stdpath("config") .. "/lua"] = true,
                  },
                },
              },
            },
          })
        end,
        -- Custom handler for emmet_ls
        ["emmet_ls"] = function()
          lspconfig.emmet_ls.setup({
            capabilities = capabilities,
            on_attach = on_attach,
            filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less" },
          })
        end,
      })
    end,
  },
}
