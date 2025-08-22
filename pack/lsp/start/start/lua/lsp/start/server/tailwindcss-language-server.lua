return function()
  require('lsp.start')({
    name = 'TailwindCSS Lanuage Server',
    cmd = { 'tailwindcss-language-server' },
    -- TODO: Add support for ^v4.0.0
    root_dir = vim.fs.root(0, { 'tailwind.config.ts', 'tailwind.config.js' }),
    settings = {
      tailwindCSS = {
        includeLanguages = {
          rust = 'html',
        },
      },
    },
  })
end
