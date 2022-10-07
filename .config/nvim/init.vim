call plug#begin()

" LSP Plugins
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'mfussenegger/nvim-jdtls'

" Git features
Plug 'itchyny/vim-gitbranch'
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'

" Navigation
Plug 'christoomey/vim-tmux-navigator'
Plug 'kassio/neoterm'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }

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

call plug#end()


