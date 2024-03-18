local configs = {
  'css',
  'go',
  'graphql',
  'html',
  'http',
  'javascript',
  'json',
  'jsonc',
  'lua',
  'markdown',
  'markdown_inline',
  'python',
  'ruby',
  'rust',
  'typescript',
  'vim',
  'yaml'
}

require('nvim-treesitter.configs').setup({
  ensure_installed = configs,
  highlight = {
    enable = true
  },
  indent = {
    enable = true
  },
})
