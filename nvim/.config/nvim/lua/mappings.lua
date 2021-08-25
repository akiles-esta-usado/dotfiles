local map = require"scripts".map

-- Eso del ; a : no sirve tanto cuando tienes un teclado en español jfsdjsdfj
-- sirve de algo el '.'?
-- Sipo, rehace un comando anterior.
--map('n', '-', ':')




-- Código Ejemplo
map('n', '<Leader>test', '<cmd>echo "hola tonto"<cr>', {silent=true })


-- Mejoran la experienci
map('n', 'Y', 'y$')
--"nnoremap n nzzv
--"nnoremap N Nzzv
map('n', 'J', 'mzJ`z')


-- Movimientos de texto
map('n', '<leader>j', '<cmd>m .+1<cr>==')
map('n', '<leader>k', '<cmd>m .-2<cr>==')

map('i', '<C-j>', '<esc><cmd>m .+1<cr>==i')
map('i', '<C-k>', '<esc><cmd>m .-2<cr>==i')

map('v', 'J', "<cmd>m '>+1<cr>gv=gv")
map('v', 'K', "<cmd>m '>-2<cr>gv=gv")


-- undo stamps al escribir
map('i', ',', ',<C-g>u')
map('i', '.', '.<C-g>u')
map('i', '[', '[<C-g>u')
map('i', ']', ']<C-g>u')
map('i', '?', '?<C-g>u')
map('i', '¿', '¿<C-g>u')
map('i', '<space>', '<space><C-g>u')

-- Clipboard
--map('v', 'C-c', '"+y')

-- Manejo multiventana
map('n', '<M-Left>',  '<cmd>vnew<cr>')
map('n', '<M-Right>', '<cmd>below vert vnew<cr>')
map('n', '<M-Up>',    '<cmd>new<cr>')
map('n', '<M-Down>',  '<cmd>below new<cr>')

map('n', '<C-Left>',  '<cmd>wincmd h<cr>')
map('n', '<C-Right>', '<cmd>wincmd l<cr>')
map('n', '<C-Up>',    '<cmd>wincmd k<cr>')
map('n', '<C-Down>',  '<cmd>wincmd j<cr>')
