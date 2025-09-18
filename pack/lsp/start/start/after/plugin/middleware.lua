vim.lsp.config('*', {
  handlers = require('lsp.start.middleware').get_client_response_handlers(
    'all-file-types',
    --- @diagnostic disable-next-line: param-type-mismatch
    vim.lsp.config['*'].handlers or {}
  ),
})

--- Notice that the parameter for the base handlers is only a best effort here.
--- The merge algorithm of the `vim.lsp.config` chain does not work for function
--- values. They get simply overwritten.
--- The special client name '*' that matches any, has the lowest priority. That
--- means any client specific handler for a method will overwrite a possible
--- middleware handler here. Furthermore, the order of the `vim.lsp.config`
--- calls matter. This script here runs as `after` plugin. That ensures it runs
--- after many other plugins/ftplugins. However, other `after` configurations
--- script can interfere with this. The same goes for optionally packaged
--- plugins that get loaded at a later point in time.
--- I wanna check for upstream issues for this merge issue.
