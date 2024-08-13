vim.api.nvim_create_autocmd("FileType", {
    pattern = "qf",
    callback = function()
        vim.api.nvim_buf_set_keymap(0, "n", "<leader>v", "<C-w><Enter><C-w>L",
            { noremap = true, silent = true }
        )

        vim.api.nvim_buf_set_keymap(0, "n", "<leader>x", "<C-w><Enter>",
            { noremap = true, silent = true }
        )
    end,
})
