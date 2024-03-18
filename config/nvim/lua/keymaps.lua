local opts = { noremap = true, silent = true }

-- Open file prompt with current path
vim.keymap.set('n', '<leader>ew', ':e <C-R>=expand(\"%:p:h\") . \'/\'<CR><CR>', opts)
vim.keymap.set('n', '<leader>e', ':e <C-R>=expand(\"%:p:h\") . \'/\'<CR>', opts)

-- Open config
vim.keymap.set('n', '<leader>so', ':e $MYVIMRC<CR>', opts)
vim.keymap.set('i', 'jk', '<Esc>', opts)

-- Copy and paste to os clipboard
-- http://vim.wikia.com/wiki/Accessing_the_system_clipboard
-- http://www.economyofeffort.com/2013/07/29/reattach-to-user-namespace-the-fix-for-your-tmux-in-os-x-woes/
-- https://robots.thoughtbot.com/how-to-copy-and-paste-with-tmux-on-mac-os-x
vim.keymap.set('n', '<leader>y', '"*y', opts)
vim.keymap.set('v', '<leader>y', '"*y', opts)
vim.keymap.set('n', '<leader>d', '"*d', opts)
vim.keymap.set('v', '<leader>d', '"*d', opts)
vim.keymap.set('n', '<leader>p', '"*p', opts)
vim.keymap.set('v', '<leader>p', '"*p', opts)


-- Moving around, tabs, windows and buffers
-- nnoremap j gj
vim.keymap.set('n', 'j', 'gj', opts)
-- nnoremap k gk
vim.keymap.set('n', 'k', 'gk', opts)

-- noremap <c-h> <c-w>h
vim.keymap.set('n', '<c-h>', '<c-w>h', opts)
-- noremap <c-k> <c-w>k
vim.keymap.set('n', '<c-k>', '<c-w>k', opts)
-- noremap <c-j> <c-w>j
vim.keymap.set('n', '<c-j>', '<c-w>j', opts)
-- noremap <c-l> <c-w>l
vim.keymap.set('n', '<c-l>', '<c-w>l', opts)

vim.cmd('iab <expr> tts strftime("%a %e, %b %Y")')
vim.cmd('iab <expr> fts strftime("%H:%M:%S %Z")')
