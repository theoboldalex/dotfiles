return {
    'mellow-theme/mellow.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    config = function()
        vim.g.mellow_bold_keywords = true
        vim.g.mellow_bold_functions = true
        vim.g.mellow_bold_variables = true
        vim.cmd.colorscheme('mellow')
    end,
}
