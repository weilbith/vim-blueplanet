local null_ls = require('null-ls')
local helpers = require('null-ls.helpers')

return {
  name = 'Detekt',
  meta = {
    url = 'https://github.com/detekt/detekt',
    description = 'Static code analysis for Kotlin',
  },
  method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
  filetypes = { 'kotlin' },
  generator = null_ls.generator({
    command = 'detekt-cli',
    args = { '--input', '$FILENAME' },
    from_stderr = true,
    format = 'line',
    on_output = helpers.diagnostics.from_patterns({
      {
        pattern = [[.*:(%d+):(%d+): [%w-/]+ (.*)]],
        groups = { 'row', 'col', 'message' },
      },
    }),
  }),
}
