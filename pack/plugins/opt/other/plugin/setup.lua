require('other-nvim').setup({
  mappings = {
    {
      pattern = 'src/(.*)/(.*).ts',
      target = 'test/%1/%2.spec.ts',
      context = 'tests',
    },
    {
      pattern = 'test/(.*)/(.*).spec.ts',
      target = 'src/%1/%2.ts',
      context = 'source',
    },
    {
      pattern = 'src/main/(.*)/(.*).spec.ts',
      target = 'src/%1/%2.ts',
      context = 'source',
    },
  },
})
