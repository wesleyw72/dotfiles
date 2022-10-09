require('plugins')
require("mason").setup()
require("mason-lspconfig").setup()
require("telescope-config")
require("mason-lspconfig").setup({
    ensure_installed = { "clangd" }
})
require'lspconfig'.clangd.setup{}
local o = vim.o

o.expandtab = true
o.smartindent = true
o.tabstop = 2
o.shiftwidth = 2
