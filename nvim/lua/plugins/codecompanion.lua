return {
    {
        "franco-ruggeri/codecompanion-spinner.nvim",
        opts = {},
        dependencies = {
            "olimorris/codecompanion.nvim",
            "nvim-lua/plenary.nvim",
        },
    },
    {
        "olimorris/codecompanion.nvim",
        opts = {},
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            require("codecompanion").setup({})
            vim.keymap.set("n", "<leader>cc", ":CodeCompanionChat<CR>")
        end,
    },
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        config = function()
            require("copilot").setup({})
        end,
    }
}
