return {
    {
        "nvim-treesitter/nvim-treesitter",
        tag = "v0.9.2",
        opts = {
            ensure_installed = {
                "c",
                "javascript",
                "typescript",
                "css",
                "gitignore",
                "graphql",
                "http",
                "json",
                "scss",
                "vim",
                "lua",
            },
            ignore_install = { "printf", "markdown" },
            query_linter = {
                enable = true,
                use_virtual_text = true,
                lint_events = { "BufWrite", "CursorHold" },
            },
            highlight = {
                disable = { "markdown" },
            },
        },
    },
}
