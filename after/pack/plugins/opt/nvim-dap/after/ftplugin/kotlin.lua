require('dap').adapters[vim.bo[0].ft] = {
  type = 'executable',
  command = 'kotlin-debug-adapter',
}

require('dap').configurations[vim.bo[0].ft] = {
  {
    type = 'kotlin',
    request = 'launch',
    name = 'All Tests',
    mainClass = 'org.junit.platform.console.ConsoleLauncher execute -m="quick.start.AppTest#testAppHasAGreeting"',
    projectRoot = '${workspaceFolder}',
  },
}

require('dap').defaults[vim.bo[0].ft].auto_continue_if_many_stopped = false
