local vim = vim
local M = {}

local local_plugin = function(name)
  vim.cmd('set rtp+=$HOME/dev/nvim/' .. name)
end

M.setup = function()
  -- local plugins

  require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    for _, v in pairs(require('a.plugins_def')) do
      use(string.format("%s/%s", v[1], v[2]))
    end

    M.initialize_plugins()
  end)
end

M.initialize_plugins = function()
  require('a.plugins.git-worktree').setup()
  require('a.plugins.compe').setup()
  require('a.plugins.telescope').setup()
  require('terminal').setup()
  -- require'nvim-treesitter.configs'.setup {
    -- ensure_installed = "maintained"
  -- }
end

return M
