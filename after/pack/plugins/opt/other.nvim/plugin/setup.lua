require('other-nvim').setup({
  mappings = {
    {
      pattern = '.*/(.*).ts',
      target = '**/%1.spec.ts',
      context = 'tests',
    },
    {
      pattern = '.*/(.*).spec.ts',
      target = '**/%1.ts',
      context = 'source',
    },
    {
      pattern = 'src/.*/(.*).vue',
      target = 'test/**/%1.spec.ts',
      context = 'tests',
    },
    {
      pattern = 'test/.*/(.*).spec.ts',
      target = 'src/**/%1.vue',
      context = 'source',
    },
    {
      pattern = 'src/main/.*/(.*).kt',
      target = 'src/test/**/%1Test.kt',
      context = 'tests',
    },
    {
      pattern = 'src/test/.*/(.*)Test.kt',
      target = 'src/main/**/%1.kt',
      context = 'tests',
    },
    -- ---
    {
      pattern = '(.*)/(.*).tsx',
      target = '%1/%2.spec.tsx',
      context = 'tests',
    },
    {
      pattern = '(.*)/(.*).spec.tsx',
      target = '%1/%2.tsx',
      context = 'source',
    },
    {
      pattern = '(.*)/(.*).tsx',
      target = '%1/%2.test.tsx',
      context = 'tests',
    },
    {
      pattern = '(.*)/(.*).test.tsx',
      target = '%1/%2.tsx',
      context = 'source',
    },
    -- ---
    -- TODO: more generic
    {
      pattern = '(.*)/(.*).tsx',
      target = '%1/%2.module.css',
      context = 'style',
    },
    {
      pattern = '(.*)/(.*).module.css',
      target = '%1/%2.tsx',
      context = 'component',
    },
  },
})
