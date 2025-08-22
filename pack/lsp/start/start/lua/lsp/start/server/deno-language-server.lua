return function()
  require('lsp.start')({
    name = 'Deno Lanugage Server',
    cmd = { 'deno', 'lsp' },
    root_dir = vim.fs.root(0, { 'deno.json', 'deno.jsonc', 'deno.lock' }),
    settings = {
      deno = {
        enable = true,
      },
    },
  })
end
