local M = {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function ()
    require("neo-tree").setup({
      window = {
        width = "30",
        -- auto_expand_width = false,
      }
    })
    vim.keymap.set('n', '<C-n>', ':Neotree filesystem reveal left toggle<CR>', {})
  end

}

return { M }
