return function()
  require("lsp.start")({
    name = "TailwindCSS Lanuage Server",
    cmd = { "tailwindcss-language-server" },
    root_dir = require("lsp.start.utilities").find_root(
      { 'tailwind.config.ts', 'tailwind.config.js' }
    ),
    settings = {
      tailwindCSS = {
        includeLanguages = {
          rust = "html",
        },
      },
    },
  })
end
