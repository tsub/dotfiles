-- Commenting
local keyopts = { remap = true, silent = true }
vim.keymap.set('n', '<C-k>', 'gcc', keyopts)
vim.keymap.set('v', '<C-k>', 'gc', keyopts)
