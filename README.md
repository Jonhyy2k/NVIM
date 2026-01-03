# My Neovim Configuration

A modern Neovim setup with LSP, Treesitter, Telescope, and more.

## Features

- 🚀 LSP support for multiple languages (Python, JavaScript/TypeScript, Lua, C/C++, Rust, Go)
- 🎨 Syntax highlighting with Treesitter
- 🔍 Fuzzy finding with Telescope
- 📁 File explorer with nvim-tree
- ✨ Autocompletion with nvim-cmp
- 🎯 Git integration with gitsigns
- 💅 Beautiful UI with TokyoNight theme

## Prerequisites

- Neovim >= 0.10.0 (0.11+ recommended)
- Git
- Node.js (for LSP servers)
- Ripgrep (for Telescope grep)
- A Nerd Font (for icons)

## Installation

1. Backup your existing config (if any):
```bash
mv ~/.config/nvim ~/.config/nvim.backup
```

2. Clone this repository:
```bash
git clone https://github.com/YOUR_USERNAME/nvim-config.git ~/.config/nvim
```

3. Start Neovim:
```bash
nvim
```

4. Plugins will automatically install on first launch. Wait for completion and restart Neovim.

## Key Bindings

See [KEYBINDINGS.txt](KEYBINDINGS.txt) for a complete reference.

**Quick reference (Leader = Space):**
- `<Space>ee` - Toggle file tree
- `<Space>ff` - Find files
- `<Space>fs` - Find string in files
- `<Space>tt` - Open terminal
- `<Space>w` - Save file
- `gd` - Go to definition
- `K` - Show documentation

## Structure

```
~/.config/nvim/
├── init.lua              # Main entry point
├── lua/
│   ├── core/
│   │   ├── options.lua   # Neovim options
│   │   └── keymaps.lua   # Core keymaps
│   └── plugins/          # Plugin configurations
├── KEYBINDINGS.txt       # Complete keybindings reference
└── README.md
```

## Customization

- Edit `lua/core/options.lua` for Neovim settings
- Edit `lua/core/keymaps.lua` for custom keybindings
- Add new plugins in `lua/plugins/` directory

## Updating

```bash
cd ~/.config/nvim
git pull
```

Then in Neovim: `:Lazy sync`
