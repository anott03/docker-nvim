for _, v in pairs(require('plugins_def')) do
  local url = string.format('https://github.com/%s/%s ~/.local/share/nvim/site/pack/packer/start/%s', v[1], v[2], v[2])
  os.execute('git clone ' .. url)
end
