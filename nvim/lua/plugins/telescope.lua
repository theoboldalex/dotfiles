return {
    "nvim-telescope/telescope.nvim", tag = "0.1.5",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function ()
        local actions = require("telescope.actions")

        require('telescope').setup {
            defaults = {
                mappings = {
                    i = { ["<esc>"] = actions.close }
                },
                file_ignore_patterns = {
                    "node%_modules/.*",
                    "vendor/",
                    ".git/",
                    ".idea/",
                    ".vscode/",
                },
            },
            pickers = {
                find_files = {
                    theme = "dropdown",
                    previewer = false,
                    hidden = true,
                    no_ignore = true,
                },
                buffers = {
                    theme = "dropdown",
                    previewer = false,
                },
                help_tags = {
                    theme = "dropdown"
                }
            }
        }
    end
}

