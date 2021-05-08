local packer = require('packer')
local use = packer.use
packer.reset()
packer.init({
  package_root = '/nvim/pack/'
})
use { 'gruvbox-community/gruvbox', config = function()
  vim.cmd [[ colorscheme gruvbox ]]
end }
vim.cmd [[ :PackerSync ]]
