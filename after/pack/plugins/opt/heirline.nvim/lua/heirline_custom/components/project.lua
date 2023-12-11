local get_highlight = require('heirline.utils').get_highlight
local surround = require('heirline.utils').surround
local get_shell_output = require('heirline_custom.utils').get_shell_output

local ProjectName = {
  update = 'DirChanged',
  init = function(self)
    local working_directory = vim.fn.fnamemodify(vim.fn.getcwd(), ':t')
    local repository_name = get_shell_output('gh repo view --json nameWithOwner -q .nameWithOwner')
    local project_path = get_shell_output('git rev-parse --show-toplevel')
    local project_directory = vim.fn.fnamemodify(project_path, ':t')
    self.root = #repository_name > 0 and repository_name
      or (#project_directory > 0 and project_directory or 'none')

    if #get_shell_output('stat ./Cargo.toml') > 0 then
      local package_name = get_shell_output(
        'cargo metadata --no-deps --format-version 1 | jq ".packages | first .name"'
      )
      self.project_icon = ''
      self.project_name = vim.fn.substitute(package_name, '"', '', 'g')
    elseif #get_shell_output('stat ./package.json') > 0 then
      local package_name = get_shell_output('jq .name ./package.json')
      local is_vue_project = #get_shell_output('jq .dependencies.vue ./package.json') > 0
      local is_typescript_project = #get_shell_output(
        'jq .devDependencies.typescript ./package.json'
      ) > 0
      self.project_icon = is_vue_project and '﵂' or (is_typescript_project and '' or '')
      self.project_name = vim.fn.substitute(package_name, '"', '', 'g')
    else
      self.project_name = working_directory ~= project_directory and working_directory or ''
    end
  end,
  surround({ '', '' }, function()
    return get_highlight('BlueBackgroundContrast').bg
  end, {
    provider = function(self)
      local showRoot = self.root ~= self.project_name
      local hasIcon = self.project_icon and #self.project_icon > 0
      local hasProject = self.project_name and #self.project_name > 0

      local output = ' '

      if showRoot then
        output = output .. self.root .. ' '
      end

      if hasIcon then
        output = output .. self.project_icon .. ' '
      end

      if hasProject and not hasIcon then
        output = output .. '  '
      end

      if hasProject then
        output = output .. self.project_name .. ' '
      end

      output = vim.fn.substitute(output, '/', '  ', 'g')

      return output
    end,
    hl = get_highlight('BlueBackgroundContrast'),
  }),
}

return ProjectName
