vim.api.nvim_set_keymap('n', '<C-T>', ':w | Ttoggle<CR>', {noremap=true})
vim.api.nvim_set_keymap('i', '<C-T>', '<Esc> :w | Ttoggle<CR>', {noremap=true})
vim.api.nvim_set_keymap('t', '<C-T>', '<C-\\><C-n>:Ttoggle<CR>', {noremap=true})
vim.api.nvim_set_keymap('n', '<C-R>', ':vs<CR>', {noremap=true})
vim.api.nvim_set_keymap('i', '<C-R>', '<Esc>:vs<CR>', {noremap=true})
vim.api.nvim_set_keymap('n', '<C-Y>', ':split<CR>', {noremap=true})
vim.api.nvim_set_keymap('i', '<C-Y>', '<Esc>:split<CR>', {noremap=true})
vim.api.nvim_set_keymap('n', '<C-N>', ':Neoformat<CR>', {noremap=true})
vim.api.nvim_set_keymap('n', 'U', ":red<CR>", {noremap=true});

-- Closing Delimters
vim.api.nvim_set_keymap('i', '{', '{}<left>', {noremap=true});
-- vim.api.nvim_set_keymap('i', '(', '()<left>', {noremap=true});
vim.api.nvim_set_keymap('i', '[', '[]<left>', {noremap=true});
vim.api.nvim_set_keymap('i', "'", "''<left>", {noremap=true});
vim.api.nvim_set_keymap('i', '"', '""<left>', {noremap=true});
vim.api.nvim_set_keymap('i', '{<CR>', '{<CR>}<left><Esc>O', {noremap=true});

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>f', builtin.find_files, {noremap=true})
vim.keymap.set('n', '<leader>g', builtin.git_files, {noremap=true})
vim.keymap.set('n', '<leader>:', builtin.commands, {noremap=true})

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("x", "<leader>p", "\"_dP")
vim.keymap.set("n", "<leader>R", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
