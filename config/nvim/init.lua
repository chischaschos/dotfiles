require('settings')
require('plugins')
-- require('theme')
require('keymaps')

local function source_files_from_dir(directory)
  for _, file in pairs(vim.fn.readdir(directory)) do
    local file = directory .. '/' .. file
    if vim.fn.filereadable(file) then
      vim.fn.execute('source ' .. file)
    end
  end
end

-- load all additional configs
local lua_config_dir = vim.fn.stdpath('config') .. '/lua'
local config_dirs = { 'plugins' }
for _, dir in pairs(config_dirs) do
  source_files_from_dir(lua_config_dir .. '/' .. dir)
end
