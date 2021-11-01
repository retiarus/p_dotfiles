vim.o.completeopt = "menuone,noselect"

require('config-plugins')
require('config-lspinstall')
require('config-lsp')
require('config-saga')
require('config-compe')
require('config-tree-sitter')

require('lua-lsp')
require('bash-lsp')
require('python-lsp')

vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])
vim.cmd([[let g:gruvbox_contrast_dark = 'hard']])

vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.relativenumber = true
