-- " Start interactive EasyAlign in visual mode (e.g. vipga)
-- xmap ga <Plug>(EasyAlign)
vim.keymap.set('n', 'ga', '<Plug>(EasyAlign)', opts)

-- " Start interactive EasyAlign for a motion/text object (e.g. gaip)
-- nmap ga <Plug>(EasyAlign)
vim.keymap.set('x', 'ga', '<Plug>(EasyAlign)', opts)
