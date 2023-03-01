colorscheme gruvbox
syntax on
set number
set ignorecase
set splitright
set smartcase
set signcolumn=yes
set expandtab
set tabstop=4
set shiftwidth=4
set relativenumber
set scrolloff=8
set hidden
set wrap
set colorcolumn=+1
set textwidth=150
set nohlsearch

let g:mapleader=" "
let g:neoterm_default_mod="botright"
let g:neoterm_autoinsert=1
let g:neoformat_basic_format_align=1
let g:neoformat_basic_format_retab = 1
let g:neoformat_basic_format_trim = 1
let g:lightline = {
			\ 'active': {
			\ 'left' : [
			\		[ 'mode', 'paste' ],
			\		[  'gitbranch', 'readonly', 'filename', 'modified' ]
			\ ]
			\ },
			\ 'component_function' : {
			\		'gitbranch' : 'gitbranch#name'
			\ },
			\ }
