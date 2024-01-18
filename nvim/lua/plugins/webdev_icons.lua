return {
    "nvim-tree/nvim-web-devicons",
    config = function()
        require("nvim-web-devicons").setup({
            override_by_extension = {
                ["ml"] = {
                    icon = "λ",
                    color = "#f05e16",
                    cterm_color = "166",
                    name = "ocaml"
                },
                ["mli"] = {
                    icon = "λ",
                    color = "#f05e16",
                    cterm_color = "166",
                    name = "ocaml"
                },
                ["xml"] = {
                    icon = "",
                    color = "#008000",
                    cterm_color = "2",
                    name = "ocaml"
                }
            }
        })
    end
}
