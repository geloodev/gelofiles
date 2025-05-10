return {
    {
        "mason-org/mason.nvim",
        version = "^1.0.0",
        opts = function(_, opts)
            vim.list_extend(opts.ensure_installed, {
                "clangd",
                "clang-format",
                "luacheck",
                "shellcheck",
                "shfmt",
                --"tailwindcss-language-server",
                "typescript-language-server",
                "css-lsp",
                "texlab",
                "intelephense",
            })
        end,
    },
    {
        "mason-org/mason-lspconfig.nvim",
        version = "^1.0.0",
    },
    {
        "neovim/nvim-lspconfig",
        opts = {
            inlay_hints = { enabled = true },
            ---@type lspconfig.options,
            servers = {
                marksman = false,
                cssls = {},
                --[[
                tailwindcss = {
                    root_dir = function(...)
                        return require("lspconfig.util").root_pattern(".git")(...)
                    end,
                },
                --]]
                tsserver = {
                    root_dir = function(...)
                        return require("lspconfig.util").root_pattern(".git")(...)
                    end,
                    single_file_support = false,
                    settings = {
                        typescript = {
                            inlayHints = {
                                includeInlayParameterNameHints = "literal",
                                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                                includeInlayFunctionParameterTypeHints = true,
                                includeInlayVariableTypeHints = false,
                                includeInlayPropertyDeclarationTypeHints = true,
                                includeInlayFunctionLikeReturnTypeHints = true,
                                includeInlayEnumMemberValueHints = true,
                            },
                        },
                        javascript = {
                            inlayHints = {
                                includeInlayParameterNameHints = "literal",
                                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                                includeInlayFunctionParameterTypeHints = true,
                                includeInlayVariableTypeHints = false,
                                includeInlayPropertyDeclarationTypeHints = true,
                                includeInlayFunctionLikeReturnTypeHints = true,
                                includeInlayEnumMemberValueHints = true,
                            },
                        },
                    },
                },
                html = {},
                lua_ls = {
                    -- enabled = false,
                    single_file_suport = true,
                    settings = {
                        Lua = {
                            workspace = {
                                checkThirdParty = false,
                            },
                            completion = {
                                workspaceWord = true,
                                callSnippet = "Both",
                            },
                            misc = {
                                parameters = {
                                    -- "--log-level=trace",
                                },
                            },
                            hint = {
                                enable = true,
                                setType = false,
                                paramType = true,
                                paramName = "Disable",
                                semicolon = "Disable",
                                arrayIndex = "Disable",
                            },
                            doc = {
                                privateName = { "^_" },
                            },
                            type = {
                                castNumberToInteger = true,
                            },
                            diagnostics = {
                                disable = { "incomplete-signature-doc", "trailing-space" },
                                -- enable = false,
                                groupSeverity = {
                                    strong = "Warning",
                                    strict = "Warning",
                                },
                                groupFileStatus = {
                                    ["ambiguity"] = "Opened",
                                    ["await"] = "Opened",
                                    ["codestyle"] = "None",
                                    ["duplicate"] = "Opened",
                                    ["global"] = "Opened",
                                    ["luadoc"] = "Opened",
                                    ["redefined"] = "Opened",
                                    ["strict"] = "Opened",
                                    ["strong"] = "Opened",
                                    ["type-check"] = "Opened",
                                    ["unbalanced"] = "Opened",
                                    ["unused"] = "Opened",
                                },
                                unusedLocalExclude = { "_*" },
                            },
                            format = {
                                enable = false,
                                defaultConfig = {
                                    indent_style = "space",
                                    indent_size = 4,
                                    continuation_indent_size = 4,
                                },
                            },
                        },
                    },
                },
                texlab = {
                    root_dir = function(...)
                        return require("lspconfig.util").root_pattern(
                            ".latexmkrc",
                            "latexmkrc",
                            "texmf.cnf",
                            "main.tex"
                        )(...)
                    end,
                    settings = {
                        texlab = {
                            build = {
                                executable = "pdflatex",
                                args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
                                onSave = true,
                            },
                            forwardSearch = {
                                executable = "zathura",
                                args = { "--synctex-forward", "%l:1:%f", "%p" },
                            },
                            latex = {
                                lint = {
                                    checkEnabled = true,
                                },
                            },
                        },
                    },
                },
            },
            setup = {
                clangd = function(_, opts)
                    opts.settings = {
                        format = {
                            enable = true,
                            config = { fallbackStype = "none" },
                        },
                    }
                end,
            },
        },
    },
    -- NVIM-CMP
    {
        "hrsh7th/nvim-cmp",
        dependencies = { "hrsh7th/cmp-emoji" },
        opts = function(_, opts)
            table.insert(opts.sources, { name = "emoji" })
        end,
    },

    -- FILETYPE-SPECIFICS
    {
        "nvim-lua/plenary.nvim",
        config = function()
            vim.api.nvim_create_autocmd("BufWritePre", {
                pattern = "*.c",
                callback = function()
                    vim.lsp.buf.format({
                        async = false,
                        filter = function(client)
                            return client.name ~= "clangd"
                        end,
                    })
                end,
            })
        end,
    },
}
