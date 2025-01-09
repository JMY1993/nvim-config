local mason = {
  "williamboman/mason.nvim",
  lazy = false,
  config = function()
    require("mason").setup()
  end,
}

local mason_lspconfig = {
  "williamboman/mason-lspconfig.nvim",
  lazy = false,
  opts = { auto_install = true },
}

local nvim_lspconfig = {
  "neovim/nvim-lspconfig",
  lazy = false,
  config = function()
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    local lspconfig = require("lspconfig")
    lspconfig.lua_ls.setup({ capabilities = capabilities })
    lspconfig.ts_ls.setup({ capabilities = capabilities })
    lspconfig.html.setup({ capabilities = capabilities })

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, {desc = "Go to definition"})
    vim.keymap.set("n", "gr", vim.lsp.buf.references, {desc = "Show references"})
    vim.keymap.set("n", "K", vim.lsp.buf.hover, {desc = "Show hover information"})
    vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename" })
    -- show document symbols
    vim.keymap.set("n", "<leader>ds", vim.lsp.buf.document_symbol, { desc = "Document symbols" })
  end,
}
return { mason, mason_lspconfig, nvim_lspconfig }
