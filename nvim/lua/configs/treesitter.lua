local options = {
    ensure_installed = {
        "bash",
        "c",
        "cmake",
        "cpp",
        "css",
        "csv",
        "dockerfile",
        "fish",
        "gitattributes",
        "gitignore",
        "go",
        "gomod",
        "gosum",
        "gotmpl",
        "gowork",
        "haskell",
        "html",
        "javascript",
        "json",
        "lua",
        "luadoc",
        "make",
        "markdown",
        "printf",
        "python",
        "rust",
        "toml",
        "vim",
        "vimdoc",
        "xml",
        "yaml",
    },

    highlight = {
        enable = true,
        use_languagetree = true,
    },

    indent = { enable = true },
}

require("nvim-treesitter.configs").setup(options)
