local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "nvchad.configs.lspconfig"

lspconfig.servers = {
    "gopls",
}

local default_servers = {
    "bashls",
    "clangd",
    "cssls",
    "dockerls",
    "html",
    "lua_ls",
    "markdown_oxide",
}

for _, lsp in ipairs(default_servers) do
    vim.lsp.config(lsp, {
        on_attach = on_attach,
        on_init = on_init,
        capabilities = capabilities,
    })
end

vim.lsp.config("gopls", {
    on_attach = function(client, bufnr)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
        on_attach(client, bufnr)
    end,
    on_init = on_init,
    capabilities = capabilities,
    cmd = { "gopls" },
    filetypes = { "go", "gomod", "gotmpl", "gowork" },
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
                QF1006 = true,
                QF1007 = true,
                S1002 = true,
                S1005 = true,
                S1008 = true,
                S1011 = true,
            },
            completeUnimported = true,
            usePlaceholders = true,
            staticcheck = true,
        },
    },
})
