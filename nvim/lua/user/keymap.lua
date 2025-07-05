vim.keymap.set("n", "<leader>fp", "<cmd>let @+ = expand('%')<CR>")
vim.keymap.set("n", "<leader>rl", ":set relativenumber! <CR>")
vim.keymap.set("n", "<leader>x", ":w<CR> :so %<CR>")
vim.keymap.set("n", "<leader>[", ":call append(line('.')-1, '')<CR>")
vim.keymap.set("n", "<leader>]", ":call append(line('.'), '')<CR>")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "c[", ":cp<CR>zz")
vim.keymap.set("n", "c]", ":cn<CR>zz")
vim.keymap.set("n", "cx", ":ccl<CR>")
vim.keymap.set("n", "<leader>o", "<cmd>!open %<cr><cr>")

-- get current file path from repo root
if vim.trim(vim.fn.system("uname")) == "Linux" then
    vim.keymap.set("n", "<leader>rp", ":!echo % | xclip -selection c<cr><cr>")
else
    vim.keymap.set("n", "<leader>rp", ":!echo % | pbcopy<cr>")
end

-- vim-fugitive
vim.keymap.set("n", "<leader>gb", "<cmd>Git blame -w<cr>")
vim.keymap.set("n", "<leader>gp", "<cmd>Git push<cr>")
vim.keymap.set("n", "<leader>gc", ":Git checkout ")
vim.keymap.set("n", "<leader>gs", ":0G<cr>")
vim.keymap.set("n", "g[", "<cmd>diffget //2<cr>")
vim.keymap.set("n", "g]", "<cmd>diffget //3<cr>")

-- ------------------ --
-- VISUAL MODE REMAPS --
-- ------------------ --

-- move selection up/down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- re-select visual selection after indent
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")
-- fix janky paste behaviour
vim.keymap.set("v", "p", '"_dP')

-- Some common stuff
vim.keymap.set("n", "<leader>mx", "<cmd>!chmod +x %<cr>")
vim.keymap.set("n", "<leader>jq", "<cmd>%!jq '.'<cr><cmd>w<cr>")
