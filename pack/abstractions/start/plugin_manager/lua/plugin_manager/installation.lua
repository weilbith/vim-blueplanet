local packer_source_url = 'https://github.com/wbthomason/packer.nvim'
local xdg_data_home = vim.env.XDG_DATA_HOME or (vim.env.HOME .. '/.local/share')
local package_path = xdg_data_home .. '/nvim/site/pack'
local has_been_setup = false

local function install_packer()
  local installation_path = package_path .. '/packer/opt/packer.nvim'

  if #vim.fn.glob(installation_path) == 0 then
    local shell_command = { 'git', 'clone', packer_source_url, installation_path }
    vim.cmd({ cmd = '!', args = shell_command })
  end
end

local function setup()
  if not has_been_setup then
    install_packer()
    vim.cmd.packadd('packer.nvim')
    require('packer').init({
      package_root = package_path,
      autoremove = true,
      display = {
        open_fn = require('packer.util').float,
        open_cmd = require('packer.util').float,
      },
    })

    require('packer').use({ 'wbthomason/packer.nvim', opt = true }) -- Else Packer wants to remove itself.
    has_been_setup = true
  end
end

local function update()
  setup()
  vim.cmd.runtime({ 'START plugin_specification.lua', bang = true })
  require('packer').sync()
end

local function install_new()
  setup()
  vim.cmd.runtime({ 'START plugin_specification.lua', bang = true })
  require('packer').install()
end

return {
  update = update,
  install_new = install_new,
}
