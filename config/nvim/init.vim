" General {{{
" Use indentation for folds
set foldmethod=indent
set foldnestmax=5
set foldlevelstart=99
set foldcolumn=0

augroup vimrcFold
  " fold vimrc itself by categories
  autocmd!
  autocmd FileType vim set foldmethod=marker
  autocmd FileType vim set foldlevel=0
augroup END

" Sets how many lines of history VIM has to remember
set history=700

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let g:mapleader = ","

" Leader key timeout
set tm=2000

" Allow the normal use of "," by pressing it twice
noremap ,, ,

" Use par for prettier line formatting
set formatprg="PARINIT='rTbgqR B=.,?_A_a Q=_s>|' par\ -w72"

" Kill the damned Ex mode.
nnoremap Q <nop>

" Make <c-h> work like <c-h> again (this is a problem with libterm)
if has('nvim')
  nnoremap <BS> <C-w>h
endif

" }}}

" vim-plug {{{

set nocompatible

call plug#begin('~/.vim/bundle')

" Support bundles
Plug 'editorconfig/editorconfig-vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'neomake/neomake'
Plug 'pechorin/any-jump.vim'
Plug 'tpope/vim-unimpaired'
Plug 'vim-airline/vim-airline'
Plug 'vim-scripts/gitignore'
Plug 'yssl/QFEnter'

" LSP
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/nvim-cmp'
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'

" For vsnip
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

" trouble
Plug 'kyazdani42/nvim-web-devicons'
Plug 'folke/trouble.nvim'

" Git
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

" Bars, panels, and files
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'majutsushi/tagbar'
Plug 'roman/golden-ratio'

" Text manipulation
Plug 'easymotion/vim-easymotion'
Plug 'godlygeek/tabular'
Plug 'junegunn/vim-easy-align'
Plug 'kana/vim-textobj-user'
Plug 'michaeljsmith/vim-indent-object'
Plug 'rhysd/vim-textobj-ruby'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'

" nolorscheme
Plug 'chriskempson/base16-vim'

" Other langs support
Plug 'fatih/vim-go'
" Plug 'jodosha/vim-godebug' uncomment when needed
Plug 'vim-ruby/vim-ruby'
Plug 'chase/vim-ansible-yaml'
Plug 'kchmck/vim-coffee-script'
Plug 'tpope/vim-markdown'
Plug 'groenewege/vim-less'
Plug 'digitaltoad/vim-jade'
Plug 'tpope/vim-cucumber'
Plug 'elixir-lang/vim-elixir'
Plug 'vim-erlang/vim-erlang-runtime'
Plug 'edkolev/erlang-motions.vim'
Plug 'moll/vim-node'
Plug 'ruby-formatter/rufo-vim'
Plug 'elzr/vim-json'
Plug 'mattn/emmet-vim'

" JS crap
Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'pangloss/vim-javascript'
Plug 'peitalin/vim-jsx-typescript'
Plug 'yuezk/vim-js'

" writing
Plug 'rhysd/vim-grammarous'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'vimwiki/vimwiki'
Plug 'michal-h21/vim-zettel'

" vale support
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'nvim-lua/plenary.nvim'

" tmux related
Plug 'christoomey/vim-tmux-navigator' " Allow pane movement to jump out of vim into tmux

call plug#end()

" }}}

" vim providers {{{
" let g:node_host_prog = '/Users/emmanueldelgado/.nvm/versions/node/v14.7.0/bin/neovim-node-host'
let g:python3_host_prog = '/usr/local/bin/python3'

" }}}

" VIM user interface {{{
"
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Turn on the WiLd menu
set wildmenu
" Tab-complete files up to longest unambiguous prefix
set wildmode=list:longest,full

" Always show current position
set ruler
set number

" Show trailing whitespace
set list

set listchars=tab:\│\ ,trail:-,extends:>,precedes:<,nbsp:+

" Height of the command bar
set cmdheight=1

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set vb t_vb=

" if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
  " set t_ut=
" endif

" Force redraw
map <silent> <leader>r :redraw!<CR>

" Default to mouse mode on
set mouse=a

" Remove trailing spaces when writing file
autocmd BufWritePre * :%s/\s\+$//e
" nmap <leader>tw :%s/\s\+$//e<CR>:w<CR>
nmap <leader>w :w<CR>

" Map ESC
imap jk <Esc>
" }}}

" Colors and Fonts {{{
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

let base16colorspace=256  " Access colors present in 256 colorspace
colorscheme base16-default-dark

" Use pleasant but very visible search hilighting
hi Search ctermfg=white ctermbg=173 cterm=none guifg=#ffffff guibg=#e5786d gui=none
hi! link Visual Search

" Searing red very visible cursor
hi Cursor guibg=red

" Use same color behind concealed unicode characters
hi clear Conceal

" Don't blink normal mode cursor
set guicursor=n-v-c:block-Cursor
set guicursor+=n-v-c:blinkon0

" Set extra options when running in GUI mode
if has("gui_running")
  set guioptions-=T
  set guioptions-=e
  set guitablabel=%M\ %t
endif
set t_Co=256

" Set utf8 as standard encoding and en_US as the standard language
if !has('nvim')
  " Only set this for vim, since neovim is utf8 as default and setting it
  " causes problems when reloading the .vimrc configuration
  set encoding=utf8
endif

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Use large font by default in MacVim
set gfn=Monaco:h19

" }}}

" Files, backups and undo {{{

" Turn backup off, since most stuff is in Git anyway...
set nobackup
set nowb
set noswapfile

" Source the vimrc file after saving it
augroup sourcing
  autocmd!
  autocmd bufwritepost .vimrc,init.vim source $MYVIMRC
augroup END

" Open file prompt with current path
nmap <leader>e :e <C-R>=expand("%:p:h") . '/'<CR>

" Open config
nmap <leader>so :e $MYVIMRC<CR>

" Fuzzy find files
nnoremap <silent> <Leader><space> :CtrlP<CR>
let g:ctrlp_max_files=0
let g:ctrlp_show_hidden=1
let g:ctrlp_custom_ignore = { 'dir': '\v[\/](.git|.cabal-sandbox|.stack-work)$' }

" }}}

" Text, tab and indent related {{{

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set nowrap "Wrap lines

" Pretty unicode haskell symbols
let g:haskell_conceal_wide = 1
let g:haskell_conceal_enumerations = 1
let hscoptions="𝐒𝐓𝐄𝐌xRtB𝔻w"

" Copy and paste to os clipboard
" http://vim.wikia.com/wiki/Accessing_the_system_clipboard
" http://www.economyofeffort.com/2013/07/29/reattach-to-user-namespace-the-fix-for-your-tmux-in-os-x-woes/
" https://robots.thoughtbot.com/how-to-copy-and-paste-with-tmux-on-mac-os-x
nmap <leader>y "*y
vmap <leader>y "*y
nmap <leader>d "*d
vmap <leader>d "*d
nmap <leader>p "*p
vmap <leader>p "*p
set clipboard=unnamed
" }}}

" Visual mode related {{{

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f', '')<CR>
vnoremap <silent> # :call VisualSelection('b', '')<CR>

" }}}

" Moving around, tabs, windows and buffers {{{

" Treat long lines as break lines (useful when moving around in them)
nnoremap j gj
nnoremap k gk

noremap <c-h> <c-w>h
noremap <c-k> <c-w>k
noremap <c-j> <c-w>j
noremap <c-l> <c-w>l

" Return to last edit position when opening files (You want this!)
augroup last_edit
  autocmd!
  autocmd BufReadPost *
       \ if line("'\"") > 0 && line("'\"") <= line("$") |
       \   exe "normal! g`\"" |
       \ endif
augroup END
" Remember info about open buffers on close
set viminfo^=%

" Open window splits in various places
nmap <leader>sh :leftabove  vnew<CR>
nmap <leader>sl :rightbelow vnew<CR>
nmap <leader>sk :leftabove  new<CR>
nmap <leader>sj :rightbelow new<CR>

" don't close buffers when you aren't displaying them
set hidden

" previous buffer, next buffer
nnoremap <leader>bp :bp<cr>
nnoremap <leader>bn :bn<cr>

" close every window in current tabview but the current
nnoremap <leader>bo <c-w>o

" delete buffer without closing pane
noremap <leader>bd :Bd<cr>

" fuzzy find buffers
noremap <leader>b<space> :CtrlPBuffer<cr>

" Neovim terminal configurations
if has('nvim')
  " Use <Esc> to escape terminal insert mode
  tnoremap <Esc> <C-\><C-n>
  " Make terminal split moving behave like normal neovim
  tnoremap <c-h> <C-\><C-n><C-w>h
  tnoremap <c-j> <C-\><C-n><C-w>j
  tnoremap <c-k> <C-\><C-n><C-w>k
  tnoremap <c-l> <C-\><C-n><C-w>l
endif

nmap <leader>ccl :ccl<CR>

" }}}

" Status line {{{

" Always show the status line
set laststatus=2

" }}}

" Helper functions {{{

function! CmdLine(str)
  exe "menu Foo.Bar :" . a:str
  emenu Foo.Bar
  unmenu Foo
endfunction

function! VisualSelection(direction, extra_filter) range
  let l:saved_reg = @"
  execute "normal! vgvy"

  let l:pattern = escape(@", '\\/.*$^~[]')
  let l:pattern = substitute(l:pattern, "\n$", "", "")

  if a:direction == 'b'
    execute "normal ?" . l:pattern . "^M"
  elseif a:direction == 'gv'
    call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.' . a:extra_filter)
  elseif a:direction == 'replace'
    call CmdLine("%s" . '/'. l:pattern . '/')
  elseif a:direction == 'f'
    execute "normal /" . l:pattern . "^M"
  endif

  let @/ = l:pattern
  let @" = l:saved_reg
endfunction

" }}}

" Alignment {{{

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" }}}

" Tags {{{

set tags=tags;/,codex.tags;/

map <leader>tt :TagbarToggle<CR>

set csverb

nnoremap <silent> <C-\> :cs find c <C-R>=expand("<cword>")<CR><CR>
if executable('ripper-tags')
  let g:tagbar_type_ruby = {
      \ 'kinds'      : ['m:modules',
                      \ 'c:classes',
                      \ 'C:constants',
                      \ 'F:singleton methods',
                      \ 'f:methods',
                      \ 'a:aliases'],
      \ 'kind2scope' : { 'c' : 'class',
                       \ 'm' : 'class' },
      \ 'scope2kind' : { 'class' : 'c' },
      \ 'ctagsbin'   : 'ripper-tags',
      \ 'ctagsargs'  : ['-f', '-']
      \ }
endif
" }}}

" Relative numbering {{{
" set relativenumber
" autocmd FocusLost * :set number
" autocmd FocusGained * :set relativenumber
" autocmd InsertEnter * :set number
" autocmd InsertLeave * :set relativenumber
" " }}}

" Fuzzy Finder FZF {{{
let g:fzf_action = {
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit',
      \ 'ctrl-t': 'tabe'
      \ }
nnoremap <c-p> :FZF<cr>
let g:fzf_preview_window = ['right:60%', 'ctrl-/']
let g:fzf_layout = { 'down': '30%' }

" nnoremap <silent> <Leader>ag :Ag <C-R><C-W><CR>
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
" }}}

" Neomake {{{

" " When writing a buffer, and on normal mode changes (after 750ms).
call neomake#configure#automake('nw', 250)
let b:neomake_ruby_enabled_makers = ['mri', 'rubocop']

" }}}

" vim-indent-guides {{{
let g:indent_guides_enable_on_vim_startup = 1
" }}}

" Writing {{{
let g:limelight_conceal_ctermfg = 'gray'
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" }}}

" Prettier {{{
autocmd FileType javascript setlocal formatprg=prettier\ --stdin
" }}}

" Go {{{
let g:go_highlight_array_whitespace_error = 1
let g:go_highlight_chan_whitespace_error = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_space_tab_error = 1
let g:go_highlight_trailing_whitespace_error = 1
let g:go_highlight_operators = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_arguments = 1
let g:go_highlight_methods = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_string_spellcheck = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 1
" }}}

" Tmux related plugins {{{
" Manually create key mappings (to avoid rebinding C-\)
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
" }}}

" QFE {{{
let g:qfenter_keymap = {}
let g:qfenter_keymap.vopen = ['<C-v>']
let g:qfenter_keymap.hopen = ['<C-CR>', '<C-s>', '<C-x>']
let g:qfenter_keymap.topen = ['<C-t>']
" }}}

" Habit breaking {{{
" noremap <Up> <NOP>
" noremap <Down> <NOP>
" noremap <Left> <NOP>
" noremap <Right> <NOP>
" noremap h <NOP>
" noremap j <NOP>
" noremap k <NOP>
" noremap l <NOP>
" how do I edit select columns?
" }}}

" rubocop {{{
function! RubocopAutocorrect()
  execute "!rubocop -a " . bufname("%")
endfunction

map <silent> <Leader>ra :call RubocopAutocorrect()<cr>
" }}}

" vimwiki {{{
let g:vimwiki_list = [{'path': '~/vimwiki/',
      \ 'syntax': 'markdown', 'ext': '.md'}]

nnoremap <silent> <Leader>wnd :VimwikiDiaryNextDay<CR>
nnoremap <silent> <Leader>wpd :VimwikiDiaryPrevDay<CR>

" search
let g:zettel_fzf_command = "rg --column --line-number --ignore-case --no-heading --color=always "
map <silent> <Leader>zo :ZettelOpen<cr>
" search insert link
map <silent> <Leader>zs :ZettelSearch<cr>
" insert back links
map <silent> <Leader>zb :ZettelBackLinks<cr>
" }}}

" abbreviations {{{
iab <expr> tts strftime("%a %e, %b %Y")
" }}}

lua << EOF
 -- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      -- { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })



-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
end

local servers = {
  'bashls',
  'eslint',
  'graphql',
  'html',
  'jsonls',
  'sorbet',
  'tsserver',
  'solargraph',
  'sqlls',
}

require('nvim-lsp-installer').setup({
  ensure_installed = servers,
  automatic_install = true
})

local lspconfig = require('lspconfig')
local cmp_nvim_lsp = require('cmp_nvim_lsp')

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local opts = {
  on_attach = on_attach,
  capabilities = capabilities,
}

for _, server in ipairs(servers) do
  lspconfig[server].setup(opts)
end

require("null-ls").setup({
  debug = true,
  on_attach = on_attach,
  capabilities = capabilities,
  sources = {
    require("null-ls").builtins.diagnostics.vale,
    },
})

require("trouble").setup {
  -- your configuration comes here
  -- or leave it empty to use the default settings
  -- refer to the configuration section below
}

EOF
