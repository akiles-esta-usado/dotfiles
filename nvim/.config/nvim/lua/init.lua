require("plugins")                                                     
require("opts")                                                        
require("scripts")
require("mappings")

-- Plugin Configuration
require("mylsp")
require("mytreesitter")
require("mytelescope")
require("mycompe")
--require"whid"





--vim.cmd('let g:gruvbox_contrast_dark = "hard"')
--vim.cmd('let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"')
--vim.cmd('let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"')
--vim.cmd('let g:gruvbox_invert_selection='0'')

vim.cmd("colo gruvbox8")  
vim.cmd("set background=dark")


-- LSP Configuration
local lsp = require'lspconfig'
lsp.pylsp.setup {}
--lsp.pylsp.plugins.mccabe.threshold = false
