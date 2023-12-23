--NORMAL MODE REMAPS -- 
vim.keymap.set("n", "<leader>1", ":E<cr>")
vim.keymap.set("n", "<leader>rl", ":set relativenumber! <cr>")
vim.keymap.set("n", "<leader>x", ":w<CR> :so %<CR>")
vim.keymap.set("n", "<leader>[", ":call append(line('.')-1, '')<CR>")
vim.keymap.set("n", "<leader>]", ":call append(line('.'), '')<CR>")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "c[", ":cp<CR>zz")
vim.keymap.set("n", "c]", ":cn<CR>zz")
vim.keymap.set("n", "cx", ":ccl<CR>")
vim.keymap.set("n", "<leader>o", "<cmd>!open %<cr><cr>")

-- vim-fugitive
vim.keymap.set("n", "<leader>gb", "<cmd>Git blame -w<cr>")
vim.keymap.set("n", "<leader>gp", "<cmd>Git push<cr>")
vim.keymap.set("n", "<leader>gc", ":Git checkout ")
vim.keymap.set("n", "<leader>gs", ":G<cr>")
vim.keymap.set("n", "g[", "<cmd>diffget //2<cr>")
vim.keymap.set("n", "g]", "<cmd>diffget //3<cr>")

-- telescope
vim.keymap.set("n", "<C-p>", "<cmd>Telescope find_files<cr>")
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
vim.keymap.set("n", "<leader>gg", "<cmd>Telescope git_branches<cr>")
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")
vim.keymap.set("n", "<leader>rg", function()
    require("telescope.builtin").grep_string({
        search = vim.fn.input("Grep > "),
        use_regex = true
    })
end)
vim.keymap.set("n", "<leader>gv", function()
    require("telescope.builtin").lsp_definitions({
        jump_type = "vsplit"
    })
end)

-- VISUAL MODE REMAPS -- 
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
-- re-select visual selection after indent
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")
-- fix janky paste behaviour
vim.keymap.set("v", "p", '"_dP')

-- Some common stuff
vim.keymap.set("n", "<leader>mx", "<cmd>!chmod +x %<cr>")
vim.keymap.set("n", "<leader>cm", "<cmd>CaseManager<cr>")
vim.keymap.set("n", "<leader>jq", "<cmd>%!jq '.'<cr><cmd>w<cr>")
