vim.api.nvim_create_autocmd({"BufwritePre"}, {
    pattern = {"*.ml"},
    callback = function()
        vim.lsp.buf.format()
    end
})

