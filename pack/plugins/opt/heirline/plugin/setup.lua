local Breadcrumbs = require('heirline_custom.components.breadcumbs')
local Tests = require('heirline_custom.components.tests')
local Project = require('heirline_custom.components.project')
local Git = require('heirline_custom.components.git')
local Lsp = require('heirline_custom.components.lsp')

local Space = { provider = ' ' }
local Gap = { provider = '%=' }

local WindowBar = { Space, Breadcrumbs, Gap, Tests, Space }
local StatusBar = { Space, Project, Space, Git, Gap, Lsp, Space }

require('heirline').setup(StatusBar, WindowBar)
