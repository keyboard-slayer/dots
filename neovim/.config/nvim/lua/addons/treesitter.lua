require("treesitter-context").setup({
    enable = true
})

require("nvim-treesitter.configs").setup({
    auto_install = true,
    highlight = {
        enable = true,
    },
    indent = {
        enable = true,
    },
})
