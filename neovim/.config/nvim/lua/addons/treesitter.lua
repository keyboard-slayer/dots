require("treesitter-context").setup({
    enable = true
})

require("nvim-treesitter.configs").setup({
    auto_install = true,
    -- NOTE: The maintainer of nvim-treesitter-cpp didn't do a release recently
    --       So I ignore it and compile it manually when needed
    ignore_install = { "cpp" },
    highlight = {
        enable = true,
    },
    indent = {
        enable = true,
    },
})


vim.api.nvim_create_autocmd('PackChanged', {
    desc = 'Handle nvim-treesitter updates',
    group = vim.api.nvim_create_augroup('nvim-treesitter-pack-changed-update-handler', { clear = true }),
    callback = function(event)
        if event.data.kind == 'update' then
            vim.notify('nvim-treesitter updated, running TSUpdate...', vim.log.levels.INFO)
            ---@diagnostic disable-next-line: param-type-mismatch
            local ok = pcall(vim.cmd, 'TSUpdate')
            if ok then
                vim.notify('TSUpdate completed successfully!', vim.log.levels.INFO)
            else
                vim.notify('TSUpdate command not available yet, skipping', vim.log.levels.WARN)
            end
        end
    end,
})
