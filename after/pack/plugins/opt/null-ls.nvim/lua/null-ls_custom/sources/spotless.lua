local null_ls = require('null-ls')
local helpers = require('null-ls.helpers')
local utils = require('null-ls.utils')
local command_resolver = require('null-ls.helpers.command_resolver')

return helpers.make_builtin({
  name = 'Spotless',
  meta = {
    url = 'https://github.com/diffplug/spotless',
    description = 'Code formatting plugin for Gradle projects',
  },
  method = null_ls.methods.FORMATTING,
  filetypes = { 'kotlin', 'java' }, -- TODO: More?
  condition = function(condition_helpers)
    -- TODO: Verify existence of Spotless Gradle plugin.
    return condition_helpers.root_has_file('build.gradle', 'build.gradle.kts')
  end,
  generator_opts = {
    command = './gradlew',
    dynamic_command = command_resolver.generic(),
    args = {
      'spotlessApply',
      '-PspotlessIdeHook=$FILENAME',
      '-PspotlessIdeHookUseStdIn',
      '-PspotlessIdeHookUseStdOut',
      '--no-configuration-cache',
      '--quiet',
    },
    to_stdin = true,
    cwd = helpers.cache.by_bufnr(function(params)
      return utils.root_pattern('build.gradle', 'build.gradle.kts')(params.bufname)
    end),
  },
  factory = helpers.formatter_factory,
})
