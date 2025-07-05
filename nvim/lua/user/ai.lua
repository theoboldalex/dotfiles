local cmd = {
    ":!code ",
    vim.loop.cwd(),
    " -g ",
    vim.api.nvim_buf_get_name(0),
    ":",
    vim.api.nvim_win_get_cursor(0)[1],
}

vim.keymap.set("n", "<C-a><C-i>", function()
    vim.cmd(table.concat(cmd))
end, { silent = true })
