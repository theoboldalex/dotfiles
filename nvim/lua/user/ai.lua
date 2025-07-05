vim.keymap.set("n", "<C-a><C-i>", function()
    local cwd = vim.loop.cwd()
    local buf = vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf())
    local line = vim.api.nvim_win_get_cursor(vim.api.nvim_get_current_win())[1]
    local mask = "!code %s -g %s:%s"

    vim.cmd(string.format(mask, cwd, buf, line))
end, { silent = true })
