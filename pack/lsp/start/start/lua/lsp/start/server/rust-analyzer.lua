return function()
  require("lsp.start")({
    name = 'Rust Analyzer',
    cmd = { 'rust-analyzer' },
    root_dir = require("lsp.start.utilities").find_root({ 'Cargo.toml' }),
    capabilities = {
      experimental = {
        serverStatusNotification = true,
        colorDiagnosticOutput = true,
      },
    },
    settings = {
      ['rust-analyzer'] = {
        inlayHints = {
          -- TODO: Figure out what is useful.
          bindingModeHints = { enable = true },
          chainingHints = { enable = true },
          closureCaptureHints = { enable = true },
          closureReturnTypeHints = { enable = 'with_block' },
          closureStyle = 'rust_analyzer',
          discriminantHints = { enable = 'always' },
          expressionAdjustmentHints = {
            enable = 'reborrow',
            mode = 'prefer_prefix',
          },
          lifetimeElisionHints = {
            enable = 'skip_trivial',
            useParameterNames = true,
          },
          reborrowHints = { enable = 'mutable' },
        },
        interpret = {
          tests = true,
        },
        lens = {
          enable = true,
          debug = { enable = false },
          run = { enable = false },
          implementations = { enable = false },
          references = {
            adt = { enable = true },
            enumVariant = { enable = true },
            method = { enable = true },
            trait = { enable = true },
            excludeImports = true,
          },
        },
        rustfmt = {
          rangeFormatting = { enable = true },
        },
        workspace = {
          symbol = {
            search = {
              kind = 'all_symbols',
              limit = 1000,
            },
          },
        },
      },
    },
  })
end
