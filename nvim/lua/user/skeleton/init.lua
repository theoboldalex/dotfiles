local skeleton_options = {
    php = {
        pattern = {"*.php"},
        command = "0r $HOME/.config/nvim/lua/user/skeleton/templates/skeleton.php",
    },
    sh = {
        pattern = {"*.sh"},
        command = "0r $HOME/.config/nvim/lua/user/skeleton/templates/skeleton.sh"
    }
}

for _, v in pairs(skeleton_options) do
    vim.api.nvim_create_autocmd({"BufNewFile"}, v)
end
