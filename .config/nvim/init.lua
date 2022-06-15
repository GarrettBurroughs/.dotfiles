-- Configure code for loading pulg --
vim.cmd([[
call plug#begin()

Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'
Plug 'szw/vim-maximizer'
Plug 'christoomey/vim-tmux-navigator'
Plug 'kassio/neoterm'
Plug 'tpope/vim-commentary'
Plug 'sbdchd/neoformat'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'gruvbox-community/gruvbox'

call plug#end()

let g:lightline = {
	\ 'active' : {
	\		'left': [ [ 'mode', 'paste' ],
	\							[ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
	\	},
	\ 'component_function' : {
	\		'gitbranch': 'gitbranch#name'
	\	},
	\}

set t_Co=256

inoremap <expr> <c-x><c-f> fzf#vim#complete#path(
    \ "find . -path '*/\.*' -prune -o -print \| sed '1d;s:^..::'",
    \ fzf#wrap({'dir': expand('%:p:h')}))

if has('nvim')
  au! TermOpen * tnoremap <buffer> <Esc> <c-\><c-n>
  " junegunn/fzf.vim
  au! FileType fzf tunmap <buffer> <Esc>
endif

" Enable alignment
let g:neoformat_basic_format_align = 1

" Enable tab to spaces conversion
let g:neoformat_basic_format_retab = 1

" Enable trimmming of trailing whitespace
let g:neoformat_basic_format_trim = 1

let g:neoformat_try_node_exe = 1
]])


-- Vim Settings
vim.cmd("syntax on")
vim.cmd("colorscheme gruvbox")
vim.o.number = true
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.signcolumn = "yes"
vim.o.expandtab = false
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.relativenumber = true
vim.o.scrolloff = 8
vim.o.hidden = true
vim.o.wrap = false
vim.o.colorcolumn = 80
vim.g.nohlsearch = true
vim.g.neoterm_default_mod = "vertical"
vim.g.neoterm_size = 60
vim.g.neoterm_autoinsert = 1

-- LSP Setup

-- LSP Keybindings 
-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-i>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'pyright', 'rust_analyzer', 'tsserver' }
-- local attatch = require'completion'.on_attatch
local lsp = require'lspconfig'




local cmp = require'cmp'

cmp.setup({
	snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      end,
    },
	mapping = {
      ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }, 
	sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
})
cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local language_servers = {"pyright", "tsserver", "rls", "clangd"}

-- for _, server in pairs(language_servers) do 
--	lsp[server].setup{
--		capabilities = capabilities, 
--		on_attach = on_attach
--	}
-- end 

lsp.pyright.setup{capabilities = capabilities, on_attach=on_attach}
lsp.tsserver.setup{capabilities = capabilities, on_attach=on_attach}
lsp.rls.setup{capabilities = capabilities, on_attach=on_attach}
lsp.clangd.setup{capabilities = capabilities, on_attach=on_attach}
-- for _, lsp in pairs(servers) do
--   require('lspconfig')[lsp].setup {
--		on_attatch = require'completion'.on_attatch,
--		flags = {
--      -- This will be the default in neovim 0.7+
--      debounce_text_changes = 150,
--    }
--  }
--end



-- Keybinds
vim.api.nvim_set_keymap('n', '<C-T>', ':w | Ttoggle<CR>', {noremap=true})
vim.api.nvim_set_keymap('i', '<C-T>', '<Esc> :w | Ttoggle<CR>', {noremap=true})
vim.api.nvim_set_keymap('t', '<C-T>', '<C-\\><C-n>:Ttoggle<CR>', {noremap=true})
vim.api.nvim_set_keymap('n', '<space><space>', ':Files<CR>', {noremap=true})
vim.api.nvim_set_keymap('i', '<C-G>f', '<Esc>:Files<CR>', {noremap=true})
vim.api.nvim_set_keymap('n', '<space>g', ':GFiles<CR>', {noremap=true})
vim.api.nvim_set_keymap('i', '<C-G>g', '<Esc>:GFiles<CR>', {noremap=true})
vim.api.nvim_set_keymap('n', '<C-R>', ':vs<CR>', {noremap=true})
vim.api.nvim_set_keymap('i', '<C-R>', '<Esc>:vs<CR>', {noremap=true})
vim.api.nvim_set_keymap('n', '<C-Y>', ':split<CR>', {noremap=true})
vim.api.nvim_set_keymap('i', '<C-Y>', '<Esc>:split<CR>', {noremap=true})
vim.api.nvim_set_keymap('n', '<C-N>', ':Neoformat<CR>', {noremap=true})
vim.api.nvim_set_keymap('n', 'U', ":red<CR>", {noremap=true});
vim.cmd([[ autocmd BufWritePre * :Neoformat]])
