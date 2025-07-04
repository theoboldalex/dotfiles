vim.api.nvim_create_autocmd({ "BufwritePre" }, {
    pattern = { "*.js", "*.ts" },
    callback = function()
        vim.lsp.buf.format()
    end
})
