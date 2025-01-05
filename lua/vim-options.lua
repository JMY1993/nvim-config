vim.g.mapleader = "<Space>"
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.opt.clipboard="unnamedplus"

if vim.g.neovide then
  local t = 0.9
  vim.g.neovide_transparency = t 
  vim.g.neovide_normal_opacity = t 
end

