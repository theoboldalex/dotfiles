local get_intelephense_license_key = function()
    local f = assert(io.open(os.getenv("HOME") .. "/intelephense/license.txt", "rb"))
    local content = f:read("*a")
    f:close()
    return string.gsub(content, "%s+", "")
end

return {
    cmd = { "intelephense", "--stdio" }, -- not sure stdio is the right option
    filetypes = { 'php' },
    init_options = {
        licenceKey = get_intelephense_license_key()
    }
}
