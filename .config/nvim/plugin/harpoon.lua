local mark = require("harpoon.mark")
local ui = require("harpoon.ui")
local term = require("harpoon.term")
local cmd_ui = require("harpoon.cmd-ui")

vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<leader>e", ui.toggle_quick_menu)
vim.keymap.set("n", "<leader>t", cmd_ui.toggle_quick_menu)

vim.keymap.set("n", "<leader>1", function() ui.nav_file(1) end)
vim.keymap.set("n", "<leader>2", function() ui.nav_file(2) end)
vim.keymap.set("n", "<leader>3", function() ui.nav_file(3) end)
vim.keymap.set("n", "<leader>4", function() ui.nav_file(4) end)

vim.keymap.set("n", "<leader>t1", function() term.sendCommand(1, 1) end)
vim.keymap.set("n", "<leader>t2", function() term.sendCommand(1, 2) end)
vim.keymap.set("n", "<leader>t3", function() term.sendCommand(1, 3) end)
vim.keymap.set("n", "<leader>t4", function() term.sendCommand(1, 4) end)


local harpoon = require("harpoon")

local project_config = {
    ["$HOME/dev/solar-series"] = {
        term = {
            cmds = {
                "npm run start"
            }
        }
    },

}

harpoon.setup({
    projects = project_config,
})

