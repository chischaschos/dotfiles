-- local fn = vim.fn
-- local cmd = vim.cmd
-- local set_theme_path = "$HOME/.config/tinted-theming/set_theme.lua"
-- local is_set_theme_file_readable = fn.filereadable(fn.expand(set_theme_path)) == 1 and true or false

-- if is_set_theme_file_readable then
--   cmd("let base16colorspace=256")
--   cmd("source " .. set_theme_path)
-- end
--
local cmd = vim.cmd
local g = vim.g

local current_theme_name = os.getenv('BASE16_THEME')
if current_theme_name and g.colors_name ~= 'base16-'..current_theme_name then
  cmd('let base16colorspace=256')
  cmd('colorscheme base16-'..current_theme_name)
end

