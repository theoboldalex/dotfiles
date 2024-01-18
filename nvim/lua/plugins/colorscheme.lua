return {
     {
         "shaunsingh/nord.nvim",
         lazy = false,
         priority = 1000,
         config = function()
             vim.g.nord_italic = false
             vim.g.nord_disable_background = true
             vim.cmd("colorscheme nord")
            vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
            vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
         end,
     }
 }


