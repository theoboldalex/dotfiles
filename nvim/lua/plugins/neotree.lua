return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "MunifTanjim/nui.nvim",
    },
    config = function()
        require("neo-tree").setup({
            default_component_configs = {
                git_status = {
                    symbols = {
                        -- Change type
                        added     = "✚",
                        modified  = "",
                        deleted   = "✖",
                        renamed   = "",
                        -- Status type
                        untracked = "",
                        ignored   = "",
                        unstaged  = "~",
                        staged    = "",
                        conflict  = "",
                    }
                },
            }
        })
    end
}
