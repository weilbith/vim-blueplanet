require('dap').adapters.kotlin = {
  type = 'executable',
  command = 'kotlin-debug-adapter',
}

require('dap').configurations.kotlin = {
  {
    type = 'kotlin',
    request = 'launch',
    name = 'All Tests',
    mainClass = 'org.junit.platform.console.ConsoleLauncher execute -m="quick.start.AppTest#testAppHasAGreeting"',
    projectRoot = '${workspaceFolder}',
  },
}

require('dap').defaults.kotlin.auto_continue_if_many_stopped = false
