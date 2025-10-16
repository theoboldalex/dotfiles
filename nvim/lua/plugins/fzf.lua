return {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        -- calling `setup` is optional for customization
        require("fzf-lua").setup({
            winopts = {
                fullscreen = true,
            }
        })

        vim.keymap.set("n", "<leader>sf", require('fzf-lua').files)
        vim.keymap.set("n", "<leader>sg", require('fzf-lua').live_grep)
        vim.keymap.set("n", "<leader>sb", require('fzf-lua').buffers)
        vim.keymap.set("n", "<leader>gg", require('fzf-lua').git_branches)
        vim.keymap.set("n", "<leader>sh", require('fzf-lua').helptags)
    end
}
