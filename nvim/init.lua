-- OPTIONS
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
vim.g.netrw_altv = 1

vim.opt.iskeyword:append("-")
vim.opt.path:append("**")
vim.opt.showmode = false
vim.opt.termguicolors = true
vim.opt.guicursor = ""
vim.opt.swapfile = false
vim.opt.exrc = true
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.clipboard = 'unnamed'
vim.opt.ignorecase = true
vim.opt.wrap = false
vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.scrolloff = 10
vim.opt.signcolumn = "no"
vim.opt.hlsearch = false
vim.opt.wildmode = 'longest:full,full'
vim.opt.splitright = true
vim.opt.confirm = true
vim.opt.grepprg = "rg --vimgrep"
vim.opt.grepformat = "%f:%l:%c:%m"

-- KEYMAP
if vim.trim(vim.fn.system("uname")) == "Linux" then
    -- get current file path from repo root
    vim.keymap.set("n", "<leader>rp", ":!echo % | xclip -selection c<cr><cr>")
else
    -- get current file path from repo root
    vim.keymap.set("n", "<leader>rp", ":!echo % | pbcopy<cr>")
end

vim.keymap.set("n", "<leader>ff", ":find ") -- could we go plugin free?
vim.keymap.set("n", "<leader>rg", ":grep ") -- could we go plugin free?
vim.keymap.set("n", "<leader>[", ":call append(line('.')-1, '')<CR>")
vim.keymap.set("n", "<leader>]", ":call append(line('.'), '')<CR>")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "c[", ":cp<CR>zz")
vim.keymap.set("n", "c]", ":cn<CR>zz")
vim.keymap.set("n", "cx", ":ccl<CR>")
vim.keymap.set("n", "<leader>o", "<cmd>!open %<cr><cr>")
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
-- move selection up/down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
-- re-select visual selection after indent
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")
-- fix janky paste behaviour
vim.keymap.set("v", "p", '"_dP')

-- PACKAGE MANAGER
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    spec = {
        { import = "plugins" }
    }
})

-- AUTOCMD
vim.api.nvim_create_autocmd({ "BufwritePre" }, {
    pattern = { "*.go", "*.lua" },
    callback = function()
        vim.lsp.buf.format()
    end
})

-- LSP
vim.diagnostic.config({
    virtual_text = { current_line = true },
})
vim.lsp.config('*', {
    root_markers = { ".git" },
})
vim.lsp.enable({
    'luals',
    'gopls',
    'intelephense',
})
