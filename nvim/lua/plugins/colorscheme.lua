return {
    {
        "shaunsingh/nord.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.g.nord_italic = false
            vim.g.nord_disable_background = true
            vim.cmd("colorscheme nord")
        end,
    }
}