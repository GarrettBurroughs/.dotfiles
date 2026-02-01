vim.lsp.enable({ 'gopls', 'emmylua_ls', 'rust_analyzer' })

vim.diagnostic.config({
    virtual_text = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true
})

require('nvim-treesitter').install { 'go', 'rust' }

require("mason").setup()

require("codecompanion").setup({
    strategies = {
        chat = {
            adapter = "gemini_cli",
        },
        inline = {
            adapter = "gemini_cli",
        },
        agent = {
            adapter = "gemini_cli",
        },
    },
    adapters = {
        acp = {
            gemini_cli = function()
                return require("codecompanion.adapters").extend("gemini_cli", {
                    defaults = {
                        auth_method = "oath-personal",
                    },
                })
            end,
        },
    },
})
