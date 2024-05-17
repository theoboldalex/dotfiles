vim.keymap.set("n", "<leader>r", ":luafile %<cr>")
vim.api.nvim_create_autocmd({"BufwritePre"}, {
    pattern = {"*.lua"},
    callback = function()
        vim.lsp.buf.format()
    end
})
