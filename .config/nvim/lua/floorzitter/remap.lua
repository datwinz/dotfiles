-- Set <Space> as <leader>
vim.g.mapleader = " "

-- Smart way to move between windows
vim.keymap.set('','<C-j>','<C-W>j')
vim.keymap.set('','<C-k>','<C-W>k')
vim.keymap.set('','<C-h>','<C-W>h')
vim.keymap.set('','<C-l>','<C-W>l')

-- Open netrw
vim.keymap.set('','<leader>gf',vim.cmd.Ex)

-- Terminal commands
vim.keymap.set('','<leader>te',vim.cmd.terminal)
vim.keymap.set('t','<Esc>',[[<C-\><C-N>]])

-- Fat finger avoidance
vim.keymap.set('c','W','w')
vim.keymap.set('c','Q','q')

-- Windows
vim.keymap.set('','<leader>c',vim.cmd.close)

-- Lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Quickfix list
vim.keymap.set("n", "<leader>n", vim.cmd.cnext)
vim.keymap.set("n", "<leader>p", vim.cmd.cprev)
