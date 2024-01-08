vim.api.nvim_create_autocmd({"BufwritePre"}, {
    pattern = {"*.go"},
    callback = function()
        vim.lsp.buf.format()
    end
})

