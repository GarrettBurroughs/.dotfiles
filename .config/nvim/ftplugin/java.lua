-- See `:help vim.lsp.start_client` for an overview of the supported `config` options.
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')

local workspace_dir = '/Users/garrettburroughs/dev/datadir/' .. project_name

local on_attach = function(client, bufnr)
	require'jdtls.setup'.add_commands()
  require'jdtls'.setup_dap()
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local cmd = {

	'/usr/bin/java', 

	'-Declipse.application=org.eclipse.jdt.ls.core.id1',
	'-Dosgi.bundles.defaultStartLevel=4',
	'-Declipse.product=org.eclipse.jdt.ls.core.product',
	'-Dlog.protocol=true',
	'-Dlog.level=ALL',
	'-Xms1g',
	'--add-modules=ALL-SYSTEM',
	'--add-opens', 'java.base/java.util=ALL-UNNAMED',
	'--add-opens', 'java.base/java.lang=ALL-UNNAMED',

	'-jar', '/Users/garrettburroughs/dev/jdtls/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar',

	'-configuration', '/Users/garrettburroughs/dev/jdtls/config_mac',

	'-data', workspace_dir, 
}

-- local settings = {
-- 	java = {
-- 		home: '/Users/garrettburroughs/.jenv/shims/java',
-- 		import: {
-- 			gradle: {
-- 				enabled: true
-- 			},
-- 			maven: {
-- 				enabled: true
-- 			},
-- 			exclusions: [
-- 			"**/node_modules/**",
-- 			"**/.metadata/**",
-- 			"**/archetype-resources/**",
-- 			"**/META-INF/maven/**",
-- 			"/**/test/**"
-- 			]
-- 		}
-- 	}
-- }


local config = {
	cmd = cmd,
  root_dir = require('jdtls.setup').find_root({'.git', 'mvnw', 'gradlew'}),
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		java = {}
	},
  init_options = {
    bundles = {}
  },
}
-- This starts a new client & server,
-- or attaches to an existing client & server depending on the `root_dir`.
require('jdtls').start_or_attach(config)
