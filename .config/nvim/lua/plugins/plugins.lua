return {
    -- { "eruizc-dev/jdtls-launcher" },
    { "mfussenegger/nvim-jdtls" },
    { "elkowar/yuck.vim" },
    { "rebelot/kanagawa.nvim" },
    { "imsnif/kdl.vim" },
    {
        "christoomey/vim-tmux-navigator",
        cmd = {
            "TmuxNavigateLeft",
            "TmuxNavigateDown",
            "TmuxNavigateUp",
            "TmuxNavigateRight",
            "TmuxNavigatePrevious",
        },
        keys = {
            { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
            { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
            { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
            { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
            { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
        },
    },
    {
        "catppuccin/nvim",
        lazy = true,
        name = "catppuccin",
        priority = 1000,
    },
    {
        "aurum77/live-server.nvim",
        run = function()
            require"live_server.util".install()
        end,
        cmd = {
            "LiveServer", "LiveServerStart", "LiveServerStop"
        },
    },
}
