set nocompatible
syntax on
filetype plugin on
let g:mapleader = "\<Space>"


au TextYankPost * silent! lua vim.highlight.on_yank()


" Vimwiki
let g:vimwiki_url_maxsave = 0
let g:vimwiki_hl_headers = 1
let g:vimwiki_ext2syntax = {'.md':'markdown'}
"let g:vimwiki_key_mappings = { 'all_maps': 0, }


let g:gruvbox_contrast_dark = "hard"
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
let g:gruvbox_invert_selection='0'

set background=dark

lua require "init"
