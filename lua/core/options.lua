-- General Neovim options
local opt = vim.opt

-- Line numbers
opt.number = true           -- Show line numbers
opt.relativenumber = true   -- Show relative line numbers
opt.numberwidth = 4         -- Set number column width

-- Tabs & indentation
opt.tabstop = 4             -- 4 spaces for tabs
opt.shiftwidth = 4          -- 4 spaces for indent width
opt.expandtab = true        -- Expand tab to spaces
opt.autoindent = true       -- Copy indent from current line
opt.smartindent = true      -- Smart autoindenting

-- Line wrapping
opt.wrap = false            -- Disable line wrapping

-- Search settings
opt.ignorecase = true       -- Ignore case when searching
opt.smartcase = true        -- Mixed case searches are case-sensitive
opt.hlsearch = true         -- Highlight search results
opt.incsearch = true        -- Show search matches as you type

-- Cursor line
opt.cursorline = true       -- Highlight current line

-- Appearance
opt.termguicolors = true    -- True color support
opt.background = "dark"     -- Dark background
opt.signcolumn = "yes"      -- Always show sign column
opt.scrolloff = 8           -- Keep 8 lines above/below cursor
opt.sidescrolloff = 8       -- Keep 8 columns left/right of cursor

-- Backspace
opt.backspace = "indent,eol,start"  -- Allow backspace on indent, eol, start

-- Clipboard
opt.clipboard:append("unnamedplus")  -- Use system clipboard

-- Split windows
opt.splitright = true       -- Split vertical window to the right
opt.splitbelow = true       -- Split horizontal window to the bottom

-- File handling
opt.swapfile = false        -- Disable swapfile
opt.backup = false          -- Disable backup
opt.undofile = true         -- Enable persistent undo
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

-- Update time
opt.updatetime = 250        -- Faster completion (default 4000ms)
opt.timeoutlen = 300        -- Time to wait for mapped sequence

-- Completion
opt.completeopt = "menuone,noselect"  -- Better completion experience

-- Mouse
opt.mouse = "a"             -- Enable mouse mode

-- Folding (using treesitter)
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldenable = false      -- Disable folding at startup
