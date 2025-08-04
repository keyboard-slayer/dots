vim.pack.add({
    "https://github.com/neovim/nvim-lspconfig",
    "https://github.com/catppuccin/nvim",
    "https://github.com/folke/flash.nvim",
    "https://github.com/nvim-lualine/lualine.nvim",
    "https://github.com/echasnovski/mini.nvim",
    "https://github.com/stevearc/oil.nvim",
    "https://github.com/nvim-treesitter/nvim-treesitter-context",
    "https://github.com/nvim-tree/nvim-web-devicons",
    "https://github.com/folke/lazydev.nvim",
    { src = "https://github.com/nvim-treesitter/nvim-treesitter", version="master" },
    { src = "https://github.com/Saghen/blink.cmp", version = vim.version.range("1.0") },
})

local addons_pattern = vim.fs.joinpath(vim.fn.stdpath('config'), 'lua', 'addons', '*.lua')
local addons_content = vim.split(vim.fn.glob(addons_pattern), '\n', { trimempty = true })

for _, addon in pairs(addons_content) do
    local name, _ = vim.fs.basename(addon):match("^(.*)%.(.*)$")

    if name ~= "init" then
        require("addons." .. name)
    end
end

