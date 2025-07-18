return {
    'mellow-theme/mellow.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    config = function()
        vim.cmd.colorscheme('mellow')
    end,
}
