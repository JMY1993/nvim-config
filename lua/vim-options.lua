vim.g.mapleader = "<Space>"
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)
vim.opt.number = true
vim.opt.wrap = false

-- wrap markdown files
vim.api.nvim_create_autocmd("FileType", {
	pattern = "markdown",
	command = "setlocal wrap",
})

-- vim.opt.showmode = false
vim.opt.cursorline = true
vim.opt.scrolloff = 10

-- clear search highlights
vim.keymap.set("n", "<Esc>", "<cmd>noh<CR>")
