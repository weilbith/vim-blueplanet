local packer_source_url = 'https://github.com/wbthomason/packer.nvim'

local function install_packer(package_path)
  local installation_path = package_path .. '/pack/packer/opt/packer.nvim'

  if #vim.api.nvim_call_function('glob', { installation_path }) == 0 then
    vim.api.nvim_command(string.format('!git clone %s %s', packer_source_url, installation_path))
  end
end

local function setup(package_path)
  install_packer(package_path)
  vim.o.packpath = vim.o.packpath .. ',' .. package_path
  vim.api.nvim_command('packadd packer.nvim')
  require('packer').init({
    package_root = package_path .. '/pack',
    autoremove = true,
    display = {
      open_fn = require('packer.util').float,
      open_cmd = require('packer.util').float,
    },
  })

  require('packer').use({ 'wbthomason/packer.nvim', opt = true }) -- Else Packer wants to remove itself.
end

local function update()
  vim.api.nvim_command('runtime! OPT register_plugin.lua')
  require('packer').sync()
end

return {
  setup = setup,
  update = update,
}
