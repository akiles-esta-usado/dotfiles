
require 'paq' {
    'savq/paq-nvim'; 
    'lifepillar/vim-gruvbox8';
    'neovim/nvim-lspconfig';  

    'nvim-lua/popup.nvim';
    'nvim-lua/plenary.nvim';
    'nvim-telescope/telescope.nvim';
    {'nvim-telescope/telescope-fzf-native.nvim', run='make' };
    {'nvim-treesitter/nvim-treesitter', run=function () vim.api.nvim_command('TSUpdate') end};
    'nvim-treesitter/playground';
    'hrsh7th/nvim-compe';
    'dstein64/nvim-scrollview';
    'vimwiki/vimwiki';

    'ThePrimeagen/vim-be-good';
}


-- 'ying17zi/vim-live-latex-preview'
-- 'neomake/neomake'
-- 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
-- 'bfrg/vim-cpp-modern' "https://vimawesome.com/plugin/vim-cpp-modern"
-- 'takac/vim-hardtime'
-- 'junegunn/goyo.vim'
-- 'jreybert/vimagit'
-- 'rust-lang/rust.vim'
-- 'tpope/vim-commentary'
-- 'vifm/vifm.vim'
-- 'kovetskiy/sxhkd-vim'
-- 'liuchengxu/vim-which-key'
-- 'vim-pandoc/vim-pandoc'
-- 'vim-pandoc/vim-pandoc-syntax' 
-- 'bling/vim-airline'
-- 'neoclide/coc.nvim', {'branch': 'release', 'for': ['json', 'lua', 'vim', 'c', 'python']}
