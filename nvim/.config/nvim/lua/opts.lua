-- vim.o.{option}:  behaves like `:set`
-- vim.go.{option}: behaves like `:setglobal`
-- vim.bo.{option}: behaves like `:setlocal` for buffer-local options
-- vim.wo.{option}: behaves like `:setlocal` for window-local options
--
-- vim.o to set global options: vim.o.hidden = true
-- vim.bo to set buffer-scoped options: vim.bo.expandtab = true
-- vim.wo to set window-scoped options: vim.wo.number = true

-- vim.o: behaves like :set
-- vim.go: behaves like :setglobal
-- vim.bo: behaves like :setlocal for buffer-local options
-- vim.wo: behaves like :setlocal for window-local options

vim.o.cursorline = true
vim.o.hlsearch = true
vim.o.background = "dark"
vim.o.inccommand = 'split'
vim.o.completeopt = "menuone,noselect"
vim.o.clipboard = "unnamedplus"
vim.o.foldmethod = 'marker'
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.autoindent = true
vim.o.expandtab = true
-- vim.o.switchbuf

vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.breakindent = true

vim.bo.tabstop = 4

--vim.g.redraw = true
vim.g.lazyredraw = true
