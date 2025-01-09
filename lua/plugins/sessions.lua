local function close_neo_tree()
  require 'neo-tree.sources.manager'.close_all()
  vim.notify('closed all')
end

local function open_neo_tree()
  vim.notify('opening neotree')
  require 'neo-tree.sources.manager'.show('filesystem')
end

return {
  "rmagatti/auto-session",
  cond = false,
  config = function()
    require("auto-session").setup({
      suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
      -- this is to solve conflict with neotree
      auto_session_create_enabled = false,
      auto_save_enabled = true,
      auto_restore_enabled = true,
      auto_session_use_git_branch = true,
      bypass_session_save_file_types = { "neo-tree" },
      pre_save_cmds = {
        close_neo_tree,
      },
      post_restore_cmds = {
        open_neo_tree,
      }
      -- end conflict solution
    })
  end,
}
