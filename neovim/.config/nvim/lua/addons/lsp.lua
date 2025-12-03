vim.lsp.config('clangd', {
    cmd = { 'clangd', '--experimental-modules-support' }
})

vim.lsp.enable({
    'lua_ls',
    'clangd',
    'pyright',
    'zls',
    'gopls',
    'metals',
    'ocamllsp',
    'hls',
})

vim.keymap.set("n", "<leader>i", vim.lsp.buf.hover)

vim.api.nvim_create_autocmd('BufWritePre', {
    callback = function()
        vim.lsp.buf.format({ async = false })
    end,
})
