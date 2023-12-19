local get_intelephense_license_key = function()
    local f = assert(io.open(os.getenv("HOME") .. "/intelephense/license.txt", "rb"))
    local content = f:read("*a")
    f:close()
    return string.gsub(content, "%s+", "")
end

return {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    dependencies = {
        -- LSP Support
        {"neovim/nvim-lspconfig"},
        {"williamboman/mason.nvim"},
        {"williamboman/mason-lspconfig.nvim"},

        -- Autocompletion
        {"hrsh7th/nvim-cmp"},
        {"hrsh7th/cmp-nvim-lsp"},
        {"L3MON4D3/LuaSnip"},
    },
    config = function()
        local lsp_zero = require("lsp-zero")

        lsp_zero.on_attach(function(client, bufnr)
            local opts = { buffer = bufnr }
            -- see :help lsp-zero-keybindings
            -- to learn the available actions
            lsp_zero.default_keymaps(opts)
            vim.keymap.set("n", "<leader>df", "<cmd>Telescope diagnostics<cr>", opts)
            vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        end)

        require("mason").setup({})
        require("mason-lspconfig").setup({
            ensure_installed = { "intelephense", "lua_ls" },
            handlers = {
                lsp_zero.default_setup,
                lua_ls = function()
                    local lua_opts = lsp_zero.nvim_lua_ls()
                    require("lspconfig").lua_ls.setup(lua_opts)
                end,
                intelephense = function()
                    require("lspconfig").intelephense.setup({
                        init_options = {
                            licenceKey = get_intelephense_license_key()
                        }
                    })
                end
            }
        })

        local cmp = require("cmp")
        local cmp_format = lsp_zero.cmp_format()

        cmp.setup({
            formatting = cmp_format,
            sources = {
                {name = "nvim_lsp"},
                {name = "nvim_lua"},
                {name = "luasnip"},
            },
            window = {
                completion = cmp.config.window.bordered({
                    winhighlight = "Normal:none,FloatBorder:none"
                }),
                documentation = cmp.config.window.bordered({
                    winhighlight = "Normal:none,FloatBorder:none"
                }),
            },
            mapping = cmp.mapping.preset.insert({
                ["<CR>"] = cmp.mapping.confirm({select = true}),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-u>"] = cmp.mapping.scroll_docs(-4),
                ["<C-d>"] = cmp.mapping.scroll_docs(4),
            }),
        })

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
