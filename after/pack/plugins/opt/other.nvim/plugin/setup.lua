require('other-nvim').setup({
  mappings = {
    {
      pattern = 'src/.*/(.*).ts',
      target = 'test/**/%1.spec.ts',
      context = 'tests',
    },
    {
      pattern = 'test/.*/(.*).spec.ts',
      target = 'src/**/%1.ts',
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
  },
})
