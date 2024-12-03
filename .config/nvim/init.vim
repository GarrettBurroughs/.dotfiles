call plug#begin()

" LSP Plugins
Plug 'neovim/nvim-lspconfig'                           " Required
Plug 'williamboman/mason.nvim', {'do': ':MasonUpdate'} " Optional
Plug 'williamboman/mason-lspconfig.nvim'               " Optional
Plug 'hrsh7th/nvim-cmp'     " Required
Plug 'hrsh7th/cmp-nvim-lsp' " Required
Plug 'L3MON4D3/LuaSnip'     " Required
Plug 'VonHeikemen/lsp-zero.nvim', {'branch': 'v2.x'}

Plug 'mfussenegger/nvim-jdtls'
" Git features
Plug 'itchyny/vim-gitbranch'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'itchyny/lightline.vim'

" Navigation
Plug 'christoomey/vim-tmux-navigator'
Plug 'kassio/neoterm'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'ThePrimeagen/harpoon'
Plug 'mbbill/undotree'

" Formatting
Plug 'tpope/vim-commentary'
Plug 'sbdchd/neoformat'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-context'
Plug 'wuelnerdotexe/vim-astro'
Plug 'styled-components/vim-styled-components', { 'branch': 'main'}

" Color theme
Plug 'gruvbox-community/gruvbox'
Plug 'joshdick/onedark.vim'
Plug 'rakr/vim-one'
Plug 'catppuccin/vim', { 'as': 'catppuccin' }

call plug#end()



