vim.api.nvim_create_autocmd({ "BufwritePost" }, {
    pattern = { "*.tf" },
    callback = function()
        vim.cmd("silent !terraform fmt %")
    end
})
