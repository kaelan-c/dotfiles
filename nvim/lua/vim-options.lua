-- Set Tab to 2 spaces
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
-- Set leader key to space
vim.g.mapleader = " "

vim.g.background = "light"

vim.opt.swapfile = false

vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

-- Set relative line numbers
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "number"
