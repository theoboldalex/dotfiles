return {
    "L3MON4D3/LuaSnip",
    config = function()
        local ls = require("luasnip")

        vim.keymap.set({ "i", "s" }, "<C-k>", function ()
            if ls.expand_or_jumpable() then
                ls.expand_or_jump()
            end
        end, { silent = true })

        vim.keymap.set({ "i", "s" }, "<C-j>", function ()
            if ls.jumpable(-1) then
                ls.jump(-1)
            end
        end, { silent = true })

        vim.keymap.set("n", "<leader><leader>s", "<cmd>source ~/.config/nvim/after/plugin/luasnip.lua<cr>")

        ls.add_snippets(
            nil,
            {
                php = {
                    ls.parser.parse_snippet("vd", "var_dump($1);"),
                    ls.parser.parse_snippet("vdd", "var_dump($1); die();"),
                    ls.parser.parse_snippet("pubf", "public function $1($2): $3\n{\n\t$0\n}\n"),
                    ls.parser.parse_snippet("prof", "protected function $1($2): $3\n{\n\t$0\n}\n"),
                    ls.parser.parse_snippet("prif", "private function $1($2): $3\n{\n\t$0\n}\n"),
                    ls.parser.parse_snippet("tt", "$$this->$1"),
                    ls.parser.parse_snippet("each", "foreach ($$1 as $$2) {\n    $0;\n}"),
                    ls.parser.parse_snippet("ii", "if ($1) {\n    $0;\n}\n"),
                    ls.parser.parse_snippet("cfn", "function ($1) {\n    $0\n}\n"),
                    ls.parser.parse_snippet("sfn", "fn ($1) => $0"),
                    ls.parser.parse_snippet("ss", "self::$0"),
                    ls.parser.parse_snippet("ns", "namespace $0;")
                },
                javascript = {
                    ls.parser.parse_snippet("log", "console.log($1);")
                },
                typescript = {
                    ls.parser.parse_snippet("log", "console.log($1);")
                }
            }
        )
    end
}
