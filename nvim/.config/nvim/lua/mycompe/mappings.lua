local map=require"scripts".map

map('n', '<leader>ff', '<cmd>lua require"telescope.builtin".find_files()<cr>')
map('n', '<leader>bb', '<cmd>lua require"telescope.builtin".buffers()<cr>')
map('n', '<leader>hh', '<cmd>lua require"telescope.builtin".help_tags()<cr>')
map('n', '<leader>dd', '<cmd>lua require"mytelescope".search_dotfiles()<cr>')
