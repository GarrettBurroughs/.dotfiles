local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mapping = {
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<C-Space>'] = cmp.mapping.complete(),
}
cmp.setup({
    mapping = cmp.mapping.preset.insert(cmp_mapping),
    sources = {{ name = 'nvim_lsp' }}
})
