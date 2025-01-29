local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.vim/bundle')

-- Support bundles
Plug 'editorconfig/editorconfig-vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'neomake/neomake'
Plug 'pechorin/any-jump.vim'
Plug 'tpope/vim-unimpaired'
Plug 'vim-scripts/gitignore'
Plug 'yssl/QFEnter'
Plug('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})
Plug 'github/copilot.vim'
Plug 'preservim/tagbar'
Plug 'kevinhwang91/nvim-ufo' --folding
Plug 'kevinhwang91/promise-async' -- required by ufo

-- LSP
Plug 'antoinemadec/FixCursorHold.nvim'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/nvim-cmp'
Plug 'ldelossa/nvim-dap-projects'
Plug 'mfussenegger/nvim-dap'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-neotest/neotest'
Plug 'nvim-neotest/nvim-nio'
Plug 'rcarriga/nvim-dap-ui'
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

Plug 'tinted-theming/base16-vim'

-- Other langs support
Plug 'fatih/vim-go'
Plug 'mrcjkb/rustaceanvim'
Plug 'scalameta/nvim-metals'

-- writing
Plug 'vimwiki/vimwiki'
Plug 'michal-h21/vim-zettel'

-- lua support
Plug 'nvim-lua/plenary.nvim'

-- tmux related
Plug 'christoomey/vim-tmux-navigator'

-- searching
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

-- status line
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'

Plug 'hashivim/vim-terraform'

vim.call('plug#end')
