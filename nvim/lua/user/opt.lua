local o = vim.opt
local g = vim.g

g.mapleader = " "
g.maplocalleader = " "
g.netrw_banner = 0
g.netrw_liststyle = 3
g.netrw_altv = 1

o.termguicolors = true
o.guicursor = ""
o.swapfile = false
o.exrc = true
o.relativenumber = true
o.number = true
o.clipboard = 'unnamed'
o.ignorecase = true
o.wrap = false
o.autoindent = true
o.expandtab = true
o.tabstop = 4
o.shiftwidth = 4
-- o.updatetime = 100
o.scrolloff = 10
o.signcolumn = "no"
o.hlsearch = false
o.wildmode = 'longest:full,full'
o.splitright = true
o.confirm = true

-- adds current git branch to status line
o.statusline = "%<%f %h%m%r%{FugitiveStatusline()}%=%-14.(%l,%c%V%) %P"

-- use rg
vim.opt.grepprg = "rg --vimgrep"
vim.opt.grepformat = "%f:%l:%c:%m"
