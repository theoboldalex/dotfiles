return {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        -- calling `setup` is optional for customization
        require("fzf-lua").setup({
            winopts = {
                fullscreen = true,
            }
        })

        vim.keymap.set("n", "<c-P>", require('fzf-lua').files, { desc = "Fzf Files" })
        vim.keymap.set("n", "<c-F>", require('fzf-lua').live_grep, { desc = "Fzf Grep" })
    end
}
