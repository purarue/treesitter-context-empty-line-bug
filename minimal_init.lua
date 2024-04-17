local current_dir = vim.fn.expand("<sfile>:p:h")
local lazypath = current_dir .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git", "--branch=stable", -- latest stable release
        lazypath
    })
end
vim.opt.rtp:prepend(lazypath)

-- Load the plugin
require("lazy").setup({
    { -- Highlight, edit, and navigate code
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        opts = {
            ensure_installed = {
                'bash', 'c', 'html', 'lua', 'luadoc', 'markdown', 'vim',
                'vimdoc'
            },
            -- Autoinstall languages that are not installed
            auto_install = true,
            highlight = {enable = true},
            indent = {enable = true}
        },
        config = function(_, opts)
            require('nvim-treesitter.install').prefer_git = true
            require('nvim-treesitter.configs').setup(opts)
        end
    }, {"nvim-treesitter/nvim-treesitter-context"}
})
