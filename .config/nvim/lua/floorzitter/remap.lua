-- Set <Space> as <leader>
vim.g.mapleader = " "

-- Smart way to move between windows
vim.keymap.set('','<C-j>','<C-W>j')
vim.keymap.set('','<C-k>','<C-W>k')
vim.keymap.set('','<C-h>','<C-W>h')
vim.keymap.set('','<C-l>','<C-W>l')

-- Open netrw
vim.keymap.set('n','<leader>gf', vim.cmd.Ex)
