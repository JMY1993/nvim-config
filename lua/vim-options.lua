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

-- neovide configurations
if vim.g.neovide then
	vim.o.guifont = "CodeNewRoman Nerd Font Mono:h13"
	vim.g.neovide_transparency = 0.95
	vim.g.neovide_normal_opacity = 0.95
end

-- highlight when yanking text
vim.api.nvim_create_autocmd(
  "TextYankPost",
  {
    group = vim.api.nvim_create_augroup("YankHighlight", { clear = true }),
    desc = "Highlight when yanking text",
    callback = function()
      vim.highlight.on_yank()
    end
  }
)

-- personal config namespace
vim.g.personal = {}
