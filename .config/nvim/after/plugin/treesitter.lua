require'nvim-treesitter.configs'.setup {
    ensure_installed = { "markdown", "javascript", "python", "c", "lua" },
    sync_install = false,
    auto_install = true,

    highlight = {
        enable = true,
        disable = { "markdown" },
        additional_vim_regex_highlighting = false,
    },
}
