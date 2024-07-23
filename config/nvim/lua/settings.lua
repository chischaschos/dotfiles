vim.g.mapleader = ','

vim.opt.foldenable = true
vim.opt.history=700
vim.opt.autoread = true
vim.opt.tm=2000
vim.opt.number = true
vim.opt.ruler = true
vim.opt.list = true
vim.opt.listchars="tab:│ ,trail:-,extends:>,precedes:<,nbsp:+"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.showcmd = true
vim.opt.showmatch = true
vim.opt.mouse = 'a'
vim.opt.autowrite = true
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.fileformats=unix,dos,mac
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.autoindent = true
vim.opt.laststatus = 2
vim.opt.secure = true
vim.opt.softtabstop = 2
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.syntax = 'on'
vim.opt.termguicolors = true
vim.opt.wildmenu = true
vim.opt.wrap = false
vim.opt.clipboard = 'unnamedplus'
vim.opt.colorcolumn='73'

vim.cmd [[
  augroup sourcing
    autocmd!
    autocmd bufwritepost init.lua source $MYVIMRC
  augroup END

  " Remove trailing spaces when writing file
  autocmd BufWritePre * :%s/\s\+$//e
  autocmd BufRead *.rs :setlocal tags=./rusty-tags.vi;/
]]



