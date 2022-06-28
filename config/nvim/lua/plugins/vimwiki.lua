local opts = { noremap = true, silent = true }

vim.g['vimwiki_list'] = {{path = '~/vimwiki/', syntax = 'markdown', ext = '.md'}}

vim.g['zettel_fzf_command'] = "rg --column --line-number --ignore-case --no-heading --color=always"

vim.keymap.set('n', '<silent> <Leader>zo', ':ZettelOpen<cr>', opts)
vim.keymap.set('n', '<silent> <Leader>zs', ':ZettelSearch<cr>', opts)
vim.keymap.set('n', '<silent> <Leader>zb', ':ZettelBackLinks<cr>', opts)
