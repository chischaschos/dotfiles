local opts = { noremap = true, silent = true }

vim.g['vimwiki_list'] = {{path = '~/vimwiki/', syntax = 'markdown', ext = '.md', auto_toc = 1}}

vim.g['zettel_fzf_command'] = "rg --column --line-number --ignore-case --no-heading --color=always"

vim.keymap.set('n', '<leader>zo', ':ZettelOpen<cr>', opts)
vim.keymap.set('n', '<leader>zs', ':ZettelSearch<cr>', opts)
vim.keymap.set('n', '<leader>zb', ':ZettelBackLinks<cr>', opts)
