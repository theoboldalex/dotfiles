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
        { "neovim/nvim-lspconfig" },
        { "williamboman/mason.nvim" },
        { "williamboman/mason-lspconfig.nvim" },

        -- Autocompletion
        { "hrsh7th/nvim-cmp" },
        { "hrsh7th/cmp-buffer" },
        { "hrsh7th/cmp-path" },
        { "saadparwaiz1/cmp_luasnip" },
        { "hrsh7th/cmp-nvim-lsp" },
        { "hrsh7th/cmp-nvim-lua" },

        -- Snippets
        { "L3MON4D3/LuaSnip" },
        { "rafamadriz/friendly-snippets" },
    },
    config = function()
        local lsp_zero = require("lsp-zero")

        lsp_zero.on_attach(function(client, bufnr)
            local opts = { buffer = bufnr }
            -- see :help lsp-zero-keybindings
            -- to learn the available actions
            lsp_zero.default_keymaps(opts)
            vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        end)

        require("mason").setup({})
        require("mason-lspconfig").setup({
            ensure_installed = { "intelephense", "lua_ls", "gopls", "bashls", "emmet_language_server", "vtsls", "elixirls" },
            handlers = {
                lsp_zero.default_setup,
                lua_ls = function()
                    -- vim.lsp.buf.add_workspace_folder()
                    local lua_opts = lsp_zero.nvim_lua_ls()
                    require("lspconfig").lua_ls.setup(lua_opts)
                end,
                intelephense = function()
                    require("lspconfig").intelephense.setup({
                        init_options = {
                            licenceKey = get_intelephense_license_key()
                        }
                    })
                end,
                gopls = function()
                    require("lspconfig").gopls.setup({})
                end,
                bashls = function()
                    require("lspconfig").bashls.setup({})
                end,
                vtsls = function()
                    require("lspconfig").vtsls.setup({})
                end,
                pyright = function()
                    require("lspconfig").pyright.setup({})
                end,
                ruff = function()
                    require("lspconfig").ruff.setup({})
                end,
                elixirls = function()
                    require("lspconfig").elixirls.setup({})
                end,
                emmet_language_server = function()
                    require("lspconfig").emmet_language_server.setup({
                        filetypes = {
                            "html",
                            "php",
                            "heex"
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
                { name = "luasnip" },
                { name = "nvim_lsp" },
                { name = "nvim_lua" },
                { name = "path" },
                { name = "buffer" }
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
                ["<CR>"] = cmp.mapping.confirm({ select = true }),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-u>"] = cmp.mapping.scroll_docs(-4),
                ["<C-d>"] = cmp.mapping.scroll_docs(4),
            }),
        })
    end
}
