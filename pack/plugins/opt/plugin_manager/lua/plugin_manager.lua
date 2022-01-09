local packer_source_url = 'https://github.com/wbthomason/packer.nvim'

local function install_packer(package_path)
  local installation_path = package_path .. '/pack/packer/opt/packer.nvim'

  if vim.fn.empty(vim.fn.glob(installation_path)) > 0 then
    vim.cmd(string.format('!git clone %s %s', packer_source_url, installation_path))
  end
end

local function setup(package_path)
  install_packer(package_path)
  vim.o.packpath = vim.o.packpath .. ',' .. package_path
  vim.cmd("packadd packer.nvim")
  packer = require('packer')
  packer.init({
    package_root = package_path .. '/pack',
    display = {
      open_fn = require('packer.util').float,
      open_cmd = require('packer.util').float,
    },
  })

  packer.use({ 'wbthomason/packer.nvim', opt = true }) -- Else Packer wants to remove itself.
end

local function update()
  vim.cmd('runtime! OPT register_plugin.lua')
  packer.sync()
end

return {
  setup = setup,
  update = update,
}
