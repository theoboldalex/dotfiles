return {
    "tpope/vim-fugitive",
    config = function()
        vim.keymap.set("n", "<leader>gb", "<cmd>Git blame -w<cr>")
        vim.keymap.set("n", "<leader>gp", "<cmd>Git push<cr>")
        vim.keymap.set("n", "<leader>gl", "<cmd>Git pull<cr>")
        vim.keymap.set("n", "<leader>gc", ":Git checkout ")
        vim.keymap.set("n", "<leader>gs", ":0G<cr>")
        vim.keymap.set("n", "g[", "<cmd>diffget //2<cr>")
        vim.keymap.set("n", "g]", "<cmd>diffget //3<cr>")
    end
}
