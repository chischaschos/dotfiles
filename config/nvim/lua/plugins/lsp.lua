local map = vim.keymap.set
local api = vim.api

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
  'ruby-lsp',
  'gopls',
  'rust',
  'rust_analyzer',
}

require('nvim-lsp-installer').setup({
  ensure_installed = servers,
  automatic_install = true
})

vim.opt_global.completeopt = { "menuone", "noinsert", "noselect" }

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }

-- See `:help vim.diagnostic.*` for documentation on any of the below functions
  map("n", "<leader>cl", vim.lsp.codelens.run)
  map("n", "gds", vim.lsp.buf.document_symbol)
  map("n", "gws", vim.lsp.buf.workspace_symbol)
  map('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
  map('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
  map('n', '<leader>e', vim.diagnostic.open_float, opts)
  map('n', '<leader>f', vim.lsp.buf.format, bufopts)
  map('n', '<leader>q', vim.diagnostic.setloclist, opts)
  map('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
  map('n', '<leader>sh', vim.lsp.buf.signature_help, bufopts)
  map('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  map('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  map('n', 'K', vim.lsp.buf.hover, bufopts)
  map('n', '[d', vim.diagnostic.goto_prev, opts)
  map('n', ']d', vim.diagnostic.goto_next, opts)
  map('n', 'gD', vim.lsp.buf.declaration, bufopts)
  map('n', 'gd', vim.lsp.buf.definition, bufopts)
  map('n', 'gi', vim.lsp.buf.implementation, bufopts)
  map('n', 'gr', vim.lsp.buf.references, bufopts)
  map('n', '<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
end

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local opts = {
  on_attach = on_attach,
  capabilities = capabilities,
}

local lspconfig = require('lspconfig')
for _, server in ipairs(servers) do
  -- local merged_opts = {}

  -- if server == 'sorbet' then
  --   merged_opts = {
  --     -- cmd = { 'bundle', 'exec', 'srb', 'tc', '--lsp' },
  --     filetypes = { 'ruby' },
  --     root_dir = lspconfig.util.root_pattern('Gemfile', '.git'),
  --     -- autostart = false
  --   }
  -- end

  -- for k,v in pairs(opts) do merged_opts[k] = v end

  lspconfig[server].setup(opts)
end

-- Metal Config
local metals_config = require("metals").bare_config()

-- Example of settings
metals_config.settings = {
  showImplicitArguments = true,
  excludedPackages = { "akka.actor.typed.javadsl", "com.github.swagger.akka.javadsl" },
}

-- *READ THIS*
-- I *highly* recommend setting statusBarProvider to true, however if you do,
-- you *have* to have a setting to display this in your statusline or else
-- you'll not see any messages from metals. There is more info in the help
-- docs about this
metals_config.init_options.statusBarProvider = "on"

-- Example if you are using cmp how to make sure the correct capabilities for snippets are set
metals_config.capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Debug settings if you're using nvim-dap
local dap = require("dap")

dap.configurations.scala = {
  {
    type = "scala",
    request = "launch",
    name = "RunOrTest",
    metals = {
      runType = "runOrTestFile",
      --args = { "firstArg", "secondArg", "thirdArg" }, -- here just as an example
    },
  },
  {
    type = "scala",
    request = "launch",
    name = "Test Target",
    metals = {
      runType = "testTarget",
    },
  },
}

metals_config.on_attach = function(client, bufnr)
  require("metals").setup_dap()
  on_attach(client, bufnr)
end

-- Autocmd that will actually be in charging of starting the whole thing
local nvim_metals_group = api.nvim_create_augroup("nvim-metals", { clear = true })
api.nvim_create_autocmd("FileType", {
  -- NOTE: You may or may not want java included here. You will need it if you
  -- want basic Java support but it may also conflict if you are using
  -- something like nvim-jdtls which also works on a java filetype autocmd.
  pattern = { "scala", "sbt", "java" },
  callback = function()
    require("metals").initialize_or_attach(metals_config)
  end,
  group = nvim_metals_group,
})
