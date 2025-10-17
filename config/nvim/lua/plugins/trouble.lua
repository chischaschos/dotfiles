-- require("trouble.config").setup {
--   modes = {
--     preview_float = {
--       mode = "diagnostics",
--       preview = {
--         type = "float",
--         relative = "editor",
--         border = "rounded",
--         title = "Preview",
--         title_pos = "center",
--         position = { 0, -2 },
--         size = { width = 0.3, height = 0.3 },
--         zindex = 200,
--       },
--     },
--   },
-- }

vim.keymap.set("n", "<leader>xx", ":Trouble diagnostics toggle<CR>")
vim.keymap.set("n", "<leader>xX", ":Trouble diagnostics toggle<CR>")
vim.keymap.set("n", "<leader>cs", ":Trouble symbols toggle focus=false<CR>")
vim.keymap.set("n", "<leader>cl", ":Trouble lsp toggle focus=false win.position=right<CR>")
vim.keymap.set("n", "<leader>xL", ":Trouble loclist toggle<CR>")
vim.keymap.set("n", "<leader>xQ", ":Trouble qflist toggle<CR>")
