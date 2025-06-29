-- create checkbox on current line
vim.keymap.set("n", "<C-l>", "0i- [ ] ")
-- check checkbox on current line
vim.keymap.set("n", "<leader>cc", "<cmd>s/^- \\[ \\]/- [x]/<cr>")
