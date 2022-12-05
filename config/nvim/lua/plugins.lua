local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.vim/bundle')

-- Support bundles
Plug 'editorconfig/editorconfig-vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'neomake/neomake'
Plug 'pechorin/any-jump.vim'
Plug 'tpope/vim-unimpaired'
Plug 'vim-airline/vim-airline'
Plug 'vim-scripts/gitignore'
Plug 'yssl/QFEnter'
Plug('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})

-- LSP
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/nvim-cmp'
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'

-- For vsnip
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

-- trouble
Plug 'kyazdani42/nvim-web-devicons'
Plug 'folke/trouble.nvim'

-- Git
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

-- Bars, panels, and files
Plug 'majutsushi/tagbar'
Plug 'roman/golden-ratio'

--  Text manipulation
Plug 'easymotion/vim-easymotion'
Plug 'godlygeek/tabular'
Plug 'junegunn/vim-easy-align'
Plug 'kana/vim-textobj-user'
Plug 'michaeljsmith/vim-indent-object'
Plug 'rhysd/vim-textobj-ruby'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'

--  nolorscheme
Plug 'tinted-theming/base16-vim'

-- Other langs support
Plug 'fatih/vim-go'
-- Plug 'jodosha/vim-godebug' uncomment when needed
-- Plug 'vim-ruby/vim-ruby'
-- Plug 'tpope/vim-markdown'
-- Plug 'groenewege/vim-less'
-- Plug 'digitaltoad/vim-jade'
-- Plug 'tpope/vim-cucumber'
-- Plug 'elixir-lang/vim-elixir'
-- Plug 'vim-erlang/vim-erlang-runtime'
-- Plug 'edkolev/erlang-motions.vim'
-- Plug 'moll/vim-node'
-- Plug 'ruby-formatter/rufo-vim'
-- Plug 'elzr/vim-json'
-- Plug 'mattn/emmet-vim'

-- JS crap
-- Plug 'leafgarland/typescript-vim'
-- Plug 'maxmellon/vim-jsx-pretty'
-- Plug 'pangloss/vim-javascript'
-- Plug 'peitalin/vim-jsx-typescript'
-- Plug 'yuezk/vim-js'

-- writing
Plug 'rhysd/vim-grammarous'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'vimwiki/vimwiki'
Plug 'michal-h21/vim-zettel'

-- lua support
Plug 'nvim-lua/plenary.nvim'

-- tmux related
Plug 'christoomey/vim-tmux-navigator'

-- searching
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

vim.call('plug#end')
