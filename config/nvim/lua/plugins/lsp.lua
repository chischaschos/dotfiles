vim.lsp.config('rust_analyzer', {
  settings = {
    ['rust-analyzer'] = {
      cargo = {
        targetDir = true,
      },
      diagnostics = {
        enable = true;
      }
    }
  }
})
vim.lsp.enable('rust_analyzer')

require("mason").setup({ PATH = "append"})
require("mason-lspconfig").setup()

require("tiny-inline-diagnostic").setup({
    -- Choose a preset style for diagnostic appearance
    -- Available: "modern", "classic", "minimal", "powerline", "ghost", "simple", "nonerdfont", "amongus"
    preset = "modern",

    -- Make diagnostic background transparent
    transparent_bg = false,

    -- Make cursorline background transparent for diagnostics
    transparent_cursorline = true,

    -- Customize highlight groups for colors
    -- Use Neovim highlight group names or hex colors like "#RRGGBB"
    hi = {
        error = "DiagnosticError",     -- Highlight for error diagnostics
        warn = "DiagnosticWarn",       -- Highlight for warning diagnostics
        info = "DiagnosticInfo",       -- Highlight for info diagnostics
        hint = "DiagnosticHint",       -- Highlight for hint diagnostics
        arrow = "NonText",             -- Highlight for the arrow pointing to diagnostic
        background = "CursorLine",     -- Background highlight for diagnostics
        mixing_color = "Normal",       -- Color to blend background with (or "None")
    },

    -- List of filetypes to disable the plugin for
    disabled_ft = {},

    options = {
        -- Display the source of diagnostics (e.g., "lua_ls", "pyright")
        show_source = {
            enabled = false,           -- Enable showing source names
            if_many = false,           -- Only show source if multiple sources exist for the same diagnostic
        },

        -- Use icons from vim.diagnostic.config instead of preset icons
        use_icons_from_diagnostic = false,

        -- Color the arrow to match the severity of the first diagnostic
        set_arrow_to_diag_color = false,


        -- Throttle update frequency in milliseconds to improve performance
        -- Higher values reduce CPU usage but may feel less responsive
        -- Set to 0 for immediate updates (may cause lag on slow systems)
        throttle = 20,

        -- Minimum number of characters before wrapping long messages
        softwrap = 30,

        -- Control how diagnostic messages are displayed
        -- NOTE: When using display_count = true, you need to enable multiline diagnostics with multilines.enabled = true
        --       If you want them to always be displayed, you can also set multilines.always_show = true.
        add_messages = {
            messages = true,           -- Show full diagnostic messages
            display_count = false,     -- Show diagnostic count instead of messages when cursor not on line
            use_max_severity = false,  -- When counting, only show the most severe diagnostic
            show_multiple_glyphs = true, -- Show multiple icons for multiple diagnostics of same severity
        },

        -- Settings for multiline diagnostics
        multilines = {
            enabled = false,           -- Enable support for multiline diagnostic messages
            always_show = false,       -- Always show messages on all lines of multiline diagnostics
            trim_whitespaces = false,  -- Remove leading/trailing whitespace from each line
            tabstop = 4,               -- Number of spaces per tab when expanding tabs
            severity = nil,            -- Filter multiline diagnostics by severity (e.g., { vim.diagnostic.severity.ERROR })
          },

        -- Show all diagnostics on the current cursor line, not just those under the cursor
        show_all_diags_on_cursorline = false,

        -- Only show diagnostics when the cursor is directly over them, no fallback to line diagnostics
        show_diags_only_under_cursor = false,

        -- Display related diagnostics from LSP relatedInformation
        show_related = {
            enabled = true,           -- Enable displaying related diagnostics
            max_count = 3,             -- Maximum number of related diagnostics to show per diagnostic
        },

        -- Enable diagnostics display in insert mode
        -- May cause visual artifacts; consider setting throttle to 0 if enabled
        enable_on_insert = false,

        -- Enable diagnostics display in select mode (e.g., during auto-completion)
        enable_on_select = false,

        -- Handle messages that exceed the window width
        overflow = {
            mode = "wrap",             -- "wrap": split into lines, "none": no truncation, "oneline": keep single line
            padding = 0,               -- Extra characters to trigger wrapping earlier
        },

        -- Break long messages into separate lines
        break_line = {
            enabled = false,           -- Enable automatic line breaking
            after = 30,                -- Number of characters before inserting a line break
        },

        -- Custom function to format diagnostic messages
        -- Receives diagnostic object, returns formatted string
        -- Example: function(diag) return diag.message .. " [" .. diag.source .. "]" end
        format = nil,

        -- Virtual text display priority
        -- Higher values appear above other plugins (e.g., GitBlame)
        virt_texts = {
            priority = 2048,
        },

        -- Filter diagnostics by severity levels
        -- Remove severities you don't want to display
        severity = {
            vim.diagnostic.severity.ERROR,
            vim.diagnostic.severity.WARN,
            vim.diagnostic.severity.INFO,
            vim.diagnostic.severity.HINT,
        },

        -- Events that trigger attaching diagnostics to buffers
        -- Default is {"LspAttach"}; change only if plugin doesn't work with your LSP setup
        overwrite_events = nil,

        -- Automatically disable diagnostics when opening diagnostic float windows
        override_open_float = false,

        -- Experimental options, subject to misbehave in future NeoVim releases
        experimental = {
          -- Make diagnostics not mirror across windows containing the same buffer
          -- See: https://github.com/rachartier/tiny-inline-diagnostic.nvim/issues/127
          use_window_local_extmarks = false,
        },
    },
})

require("noice").setup({
  lsp = {
    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
    },
  },
  -- you can enable a preset for easier configuration
  presets = {
    bottom_search = true, -- use a classic bottom cmdline for search
    command_palette = true, -- position the cmdline and popupmenu together
    long_message_to_split = true, -- long messages will be sent to a split
    inc_rename = false, -- enables an input dialog for inc-rename.nvim
    lsp_doc_border = false, -- add a border to hover docs and signature help
  },
})
-- local map = vim.keymap.set
-- local api = vim.api

-- local servers = {
--   'bashls',
--   'bzl',
--   'eslint',
--   'gopls',
--   'graphql',
--   'html',
--   'jsonls',
--   'pyright',
--   'ruby_lsp',
--   'rust_analyzer',
--   'solargraph',
--   'sorbet',
--   'sqlls',
--   'ts_ls',
-- }

-- -- require('nvim-lsp-installer').setup({
-- --   ensure_installed = servers,
-- --   automatic_install = true
-- -- })

-- vim.opt_global.completeopt = { "menuone", "noinsert", "noselect" }

-- -- Use an on_attach function to only map the following keys
-- -- after the language server attaches to the current buffer
-- local on_attach = function(client, bufnr)
--   -- Enable completion triggered by <c-x><c-o>
--   api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

--   -- Mappings.
--   -- See `:help vim.lsp.*` for documentation on any of the below functions
--   local bufopts = { noremap=true, silent=true, buffer=bufnr }
--   vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })

-- -- See `:help vim.diagnostic.*` for documentation on any of the below functions
--   map("n", "<leader>cl", vim.lsp.codelens.run)
--   map("n", "gds", vim.lsp.buf.document_symbol)
--   map("n", "gws", vim.lsp.buf.workspace_symbol)
--   map('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
--   map('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
--   map('n', '<leader>f', vim.lsp.buf.format, bufopts)
--   map('n', '<leader>of', vim.diagnostic.open_float, opts)
--   map('n', '<leader>q', vim.diagnostic.setloclist, opts)
--   map('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
--   map('n', '<leader>sh', vim.lsp.buf.signature_help, bufopts)
--   map('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
--   map('n', '<leader>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, bufopts)
--   map('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
--   map('n', 'K', vim.lsp.buf.hover, bufopts)
--   map('n', '[d', vim.diagnostic.goto_prev, opts)
--   map('n', ']d', vim.diagnostic.goto_next, opts)
--   map('n', 'gD', vim.lsp.buf.declaration, bufopts)
--   map('n', 'gd', vim.lsp.buf.definition, bufopts)
--   map('n', 'gi', vim.lsp.buf.implementation, bufopts)
--   map('n', 'gr', vim.lsp.buf.references, bufopts)
-- end

-- local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- local opts = {
--   on_attach = on_attach,
--   capabilities = capabilities,
-- }

-- local lspconfig = require('lspconfig')
-- for _, server in ipairs(servers) do
--   local merged_opts = {}

--   if server == 'bzl' then
--     merged_opts = {
--       filetypes = { 'bzl', 'star' },
--       root_dir = lspconfig.util.root_pattern(".git")
--     }
--   end

--   if server == 'ruby-lsp' then
--     merged_opts = {
--       formatter = 'standard',
--       linters = { 'standard' },
--     }
--   end

--   if server == 'sorbet' then
--     merged_opts = {
--       root_dir = lspconfig.util.root_pattern("sorbet/config"),
--     }
--   end

--   for k,v in pairs(opts) do merged_opts[k] = v end

--   lspconfig[server].setup(merged_opts)
-- end

-- -- Metal Config
-- local metals_config = require("metals").bare_config()

-- -- Example of settings
-- metals_config.settings = {
--   showImplicitArguments = true,
--   excludedPackages = { "akka.actor.typed.javadsl", "com.github.swagger.akka.javadsl" },
-- }

-- -- *READ THIS*
-- -- I *highly* recommend setting statusBarProvider to true, however if you do,
-- -- you *have* to have a setting to display this in your statusline or else
-- -- you'll not see any messages from metals. There is more info in the help
-- -- docs about this
-- metals_config.init_options.statusBarProvider = "on"

-- -- Example if you are using cmp how to make sure the correct capabilities for snippets are set
-- metals_config.capabilities = require("cmp_nvim_lsp").default_capabilities()

-- -- Debug settings if you're using nvim-dap
-- local dap = require("dap")

-- dap.configurations.scala = {
--   {
--     type = "scala",
--     request = "launch",
--     name = "RunOrTest",
--     metals = {
--       runType = "runOrTestFile",
--       --args = { "firstArg", "secondArg", "thirdArg" }, -- here just as an example
--     },
--   },
--   {
--     type = "scala",
--     request = "launch",
--     name = "Test Target",
--     metals = {
--       runType = "testTarget",
--     },
--   },
-- }

-- metals_config.on_attach = function(client, bufnr)
--   require("metals").setup_dap()
--   on_attach(client, bufnr)
-- end

-- -- Autocmd that will actually be in charging of starting the whole thing
-- local nvim_metals_group = api.nvim_create_augroup("nvim-metals", { clear = true })
-- api.nvim_create_autocmd("FileType", {
--   -- NOTE: You may or may not want java included here. You will need it if you
--   -- want basic Java support but it may also conflict if you are using
--   -- something like nvim-jdtls which also works on a java filetype autocmd.
--   pattern = { "scala", "sbt", "java" },
--   callback = function()
--     require("metals").initialize_or_attach(metals_config)
--   end,
--   group = nvim_metals_group,
-- })

-- -- textDocument/diagnostic support until 0.10.0 is released
-- _timers = {}
-- local function setup_diagnostics(client, buffer)
--   if require("vim.lsp.diagnostic")._enable then
--     return
--   end

--   local diagnostic_handler = function()
--     local params = vim.lsp.util.make_text_document_params(buffer)
--     client.request("textDocument/diagnostic", { textDocument = params }, function(err, result)
--       if err then
--         local err_msg = string.format("diagnostics error - %s", vim.inspect(err))
--         vim.lsp.log.error(err_msg)
--       end
--       local diagnostic_items = {}
--       if result then
--         diagnostic_items = result.items
--       end
--       vim.lsp.diagnostic.on_publish_diagnostics(
--         nil,
--         vim.tbl_extend("keep", params, { diagnostics = diagnostic_items }),
--         { client_id = client.id }
--       )
--     end)
--   end

--   diagnostic_handler() -- to request diagnostics on buffer when first attaching

--   vim.api.nvim_buf_attach(buffer, false, {
--     on_lines = function()
--       if _timers[buffer] then
--         vim.fn.timer_stop(_timers[buffer])
--       end
--       _timers[buffer] = vim.fn.timer_start(200, diagnostic_handler)
--     end,
--     on_detach = function()
--       if _timers[buffer] then
--         vim.fn.timer_stop(_timers[buffer])
--       end
--     end,
--   })
-- end

-- -- Associate the Starlark file types with the LSP server
-- vim.api.nvim_exec([[
--   autocmd BufRead,BufNewFile *.star set filetype=bzl
-- ]], false)
