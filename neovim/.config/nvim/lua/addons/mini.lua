require("mini.icons").setup({})
require("mini.pairs").setup({})
require("mini.extra").setup({})

require("mini.pick").setup({
    window = {
        prompt_caret = '█',
    },
})

vim.api.nvim_set_hl(0, 'MiniHipatternsUrl', { fg = '#569CD6', underline = true })

local hipatterns = require('mini.hipatterns')
hipatterns.setup({
    highlighters = {
        -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
        fixme = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
        hack  = { pattern = '%f[%w]()HACK()%f[%W]', group = 'MiniHipatternsHack' },
        todo  = { pattern = '%f[%w]()TODO()%f[%W]', group = 'MiniHipatternsTodo' },
        note  = { pattern = '%f[%w]()NOTE()%f[%W]', group = 'MiniHipatternsNote' },
        url   = { pattern = '()https?://%S+()', group = 'MiniHiPatternsUrl' },
    },
})

vim.ui.select = MiniPick.ui_select

vim.keymap.set('n', '<leader>ff', MiniPick.builtin.files)
vim.keymap.set('n', '<leader>fg', MiniPick.builtin.grep_live)
vim.keymap.set('n', '<leader>fh', MiniPick.builtin.help)
vim.keymap.set('n', '<leader><leader>', MiniPick.builtin.buffers)

vim.keymap.set('n', 'gd', function()
    MiniExtra.pickers.lsp({ scope = "definition" })
end)

vim.keymap.set('n', 'gr', function()
    MiniExtra.pickers.lsp({ scope = "references" })
end)

vim.keymap.set('n', 'gs', function()
    MiniExtra.pickers.lsp({ scope = "workspace_symbol" })
end)
