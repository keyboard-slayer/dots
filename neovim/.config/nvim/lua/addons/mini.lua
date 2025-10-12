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
        url   = { pattern = '()https?://[%w%-%._~:/%?#@!$&\'%(%)%*%+,%%=]*[%w/_~#=]()', group = 'MiniHiPatternsUrl' },
    },
})

vim.ui.select = MiniPick.ui_select
