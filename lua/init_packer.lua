local test_site  = '/home/thore/.cache/nvim_test_site'
local packer_install_path = test_site .. '/pack/packer/opt/packer.nvim'
local packer_source_url = 'https://github.com/wbthomason/packer.nvim'

vim.o.packpath = vim.o.packpath .. ',' .. test_site

if vim.fn.empty(vim.fn.glob(packer_install_path)) > 0 then
  vim.cmd(string.format('!git clone %s %s', packer_source_url, packer_install_path))
end

vim.cmd("packadd packer.nvim")
packer = require('packer')
packer.init({
  package_root = test_site .. '/pack',
  display = {
    open_fn = require('packer.util').float,
    open_cmd = require('packer.util').float,
  },
})

packer.use({ 'wbthomason/packer.nvim', opt = true }) -- Else Packer wants to remove itself.
