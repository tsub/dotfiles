-- This file sets the keymap for Neovim built-in functions
-- See plugin settings for plugin dependent keymaps

local keyopts = { noremap = true, silent = true }
local remap_keyopts = { remap = true, silent = true }

-- Insert mode
vim.keymap.set('i', 'jj', '<ESC>', keyopts)

-- Normal mode
vim.keymap.set('n', ';', ':', keyopts)
vim.keymap.set('n', '<F5>', ':e!<CR>', keyopts)
vim.keymap.set('n', '<leader>/', ':noh<CR>', keyopts)

-- Terminal mode
vim.keymap.set('t', '<C-j><C-j>', '<C-\\><C-n>', keyopts)

-- Pane navigation
vim.keymap.set('n', '<C-w><C-h>', ':vertical resize -5<CR>', keyopts)
vim.keymap.set('n', '<C-w><C-j>', ':resize +5<CR>', keyopts)
vim.keymap.set('n', '<C-w><C-k>', ':resize -5<CR>', keyopts)
vim.keymap.set('n', '<C-w><C-l>', ':vertical resize +5<CR>', keyopts)

-- Commenting
vim.keymap.set('n', '<C-k>', 'gcc', remap_keyopts)
vim.keymap.set('v', '<C-k>', 'gc', remap_keyopts)
