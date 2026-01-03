-- Core keymaps
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Leader key is set to space in init.lua

-- General keymaps
keymap("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- Window management
keymap("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap("n", "<leader>sx", ":close<CR>", { desc = "Close current split" })

-- Window navigation
keymap("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
keymap("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
keymap("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
keymap("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

-- Resize windows with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Buffer management
keymap("n", "<leader>bn", ":bnext<CR>", { desc = "Go to next buffer" })
keymap("n", "<leader>bp", ":bprevious<CR>", { desc = "Go to previous buffer" })
keymap("n", "<leader>bd", ":bdelete<CR>", { desc = "Delete current buffer" })

-- Tab management
keymap("n", "<leader>to", ":tabnew<CR>", { desc = "Open new tab" })
keymap("n", "<leader>tx", ":tabclose<CR>", { desc = "Close current tab" })
keymap("n", "<leader>tn", ":tabn<CR>", { desc = "Go to next tab" })
keymap("n", "<leader>tp", ":tabp<CR>", { desc = "Go to previous tab" })

-- Indenting in visual mode
keymap("v", "<", "<gv", { desc = "Indent left and reselect" })
keymap("v", ">", ">gv", { desc = "Indent right and reselect" })

-- Move text up and down
keymap("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
keymap("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Better paste (doesn't replace clipboard)
keymap("v", "p", '"_dP', { desc = "Paste without yanking" })

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Quick save and quit
keymap("n", "<leader>w", ":w<CR>", { desc = "Save file" })
keymap("n", "<leader>q", ":q<CR>", { desc = "Quit" })
keymap("n", "<leader>Q", ":qa!<CR>", { desc = "Quit all without saving" })

-- Terminal mode
keymap("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
keymap("n", "<leader>tt", ":terminal<CR>", { desc = "Open terminal" })
