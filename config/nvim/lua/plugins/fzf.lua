local opts = { noremap = true, silent = true }

vim.g['fzf_action'] = {
  ['ctrl-s'] = 'split',
  ['ctrl-v'] = 'vsplit',
  ['ctrl-t'] = 'tabe'
}
vim.g['fzf_preview_window'] = {'right:60%', 'ctrl-/'}
vim.g['fzf_layout'] = { down = '30%' }

vim.keymap.set('n', '<c-p>', ':FZF<cr>', opts)
vim.keymap.set('n', '<c-s>', ':RG<cr>', opts)
