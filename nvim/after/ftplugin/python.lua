vim.keymap.set("n", "<leader>r", ":!python3 %<cr>")
vim.api.nvim_create_autocmd({ "BufwritePre" }, {
    pattern = { "*.py" },
    callback = function()
        vim.lsp.buf.format()
    end
})
