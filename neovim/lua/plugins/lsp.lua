return {
  "hrsh7th/nvim-cmp",
  -- "VonHeikemen/lsp-zero.nvim",
  -- branch = "v1.x",
  dependencies = {
    -- LSP Support
    { "neovim/nvim-lspconfig" }, -- Required
    { "williamboman/mason.nvim" }, -- Optional
    { "williamboman/mason-lspconfig.nvim" }, -- Optional
    { "WhoIsSethDaniel/mason-tool-installer.nvim" }, -- Optional
    { "onsails/lspkind.nvim" }, -- Optional

    -- LSP UI Tweaks/Plugins
    { "j-hui/fidget.nvim", opts = {} }, -- Required. LSP progress messages

    -- Autocompletion
    -- { "hrsh7th/nvim-cmp" }, -- Required
    { "hrsh7th/cmp-nvim-lsp" }, -- Required
    { "hrsh7th/cmp-buffer" }, -- Optional
    { "hrsh7th/cmp-path" }, -- Optional
    { "saadparwaiz1/cmp_luasnip" }, -- Optional
    { "hrsh7th/cmp-nvim-lua" }, -- Optional

    -- Snippets
    { "L3MON4D3/LuaSnip" }, -- Required
    { "rafamadriz/friendly-snippets" }, -- Optional
  },
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    --require("lsp-zero")

    local cmp = require("cmp")

    -- cmp setup
    cmp.setup({
      snippet = {
        expand = function()
          require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
        end,
      },
      window = {},
      mapping = cmp.mapping.preset.insert({
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
        ["<SPACE>"] = cmp.mapping.confirm(),
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-TAB>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          else
            fallback()
          end
        end),
      }),
      sources = cmp.config.sources({
        { name = "nvim_lua" },
        { name = "luasnip" },
        { name = "path" },
        { name = "buffer" },
        { name = "nvim_lsp" },
      }),
      formatting = {
        format = require("lspkind").cmp_format({
          menu = {
            buffer = "[Buffer]",
            nvim_lsp = "[LSP]",
            luasnip = "[LuaSnip]",
            nvim_lua = "[Lua]",
            latex_symbols = "[Latex]",
          },
        }),
      },
    })

    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    local map = function(bufnr, key, value)
      vim.keymap.set("n", key, value, { noremap = true, silent = true, buffer = bufnr })
      -- vim.api.nvim_buf_set_keymap(0, type, key, value, { noremap = true, silent = true })
    end

    local on_attach = function(_client, buf_num)
      map(buf_num, "gd", vim.lsp.buf.definition)
      map(buf_num, "gD", vim.lsp.buf.declaration)
      map(buf_num, "K", vim.lsp.buf.hover)
      map(buf_num, "gr", vim.lsp.buf.references)
      map(buf_num, "gs", vim.lsp.buf.signature_help)
      map(buf_num, "gi", vim.lsp.buf.implementation)
      map(buf_num, "gt", vim.lsp.buf.type_definition)
      map(buf_num, "<leader>gw", vim.lsp.buf.document_symbol)
      map(buf_num, "<leader>gW", vim.lsp.buf.workspace_symbol)
      map(buf_num, "<leader>ah", vim.lsp.buf.hover)

      map(buf_num, "<leader>lh", function()
        local is_enabled = vim.lsp.inlay_hint.is_enabled()

        vim.lsp.inlay_hint.enable(not is_enabled)
      end)

      map(buf_num, "<leader>af", vim.lsp.buf.code_action)
      map(buf_num, "<leader>ee", function()
        vim.diagnostic.open_float(0, { scope = "line" })
      end)
      map(buf_num, "<leader>ar", vim.lsp.buf.rename)
      map(buf_num, "<leader>=", vim.lsp.buf.format)
      map(buf_num, "<leader>ai", vim.lsp.buf.incoming_calls)
      map(buf_num, "<leader>ao", vim.lsp.buf.outgoing_calls)
    end

    local servers = {
      eslint = {
        cmd = { "vscode-eslint-language-server", "--stdio", "--max-old-space-size=12288" },
        settings = {
          format = false,
        },
      },
      html = {},
      jsonls = {},
      lua_ls = {
        settings = {
          Lua = {
            completiton = {
              callSnippet = "Replace",
            },
            hint = {
              enable = true,
            },
            --     runtime = { version = "LuaJIT" },
            --     workspace = {
            --       checkThirdParty = false,
            --       -- Tells lua_ls where to find all the Lua files that you have loaded
            --       -- for your neovim configuration.
            --       library = {
            --         "${3rd}/luv/library",
            --         unpack(vim.api.nvim_get_runtime_file("", true)),
            --       },
            --     },
            --     telemetry = { enabled = false },
          },
        },
      },
      marksman = {},
      tailwindcss = {},
      tsserver = {
        settings = {
          -- maxTsServerMemory = 12288,
          typescript = {
            inlayHints = {
              includeInlayEnumMemberValueHints = true,
              includeInlayFunctionLikeReturnTypeHints = true,
              includeInlayFunctionParameterTypeHints = true,
              includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
              includeInlayParameterNameHintsWhenArgumentMatchesName = true,
              includeInlayPropertyDeclarationTypeHints = true,
              includeInlayVariableTypeHints = true,
            },
          },
          javascript = {
            inlayHints = {
              includeInlayParameterNameHints = "all",
              includeInlayParameterNameHintsWhenArgumentMatchesName = true,
              includeInlayFunctionParameterTypeHints = true,
              includeInlayVariableTypeHints = true,
              includeInlayVariableTypeHintsWhenTypeMatchesName = true,
              includeInlayPropertyDeclarationTypeHints = true,
              includeInlayFunctionLikeReturnTypeHints = true,
              includeInlayEnumMemberValueHints = true,
            },
          },
        },
      },
      yamlls = {},
    }

    local formatters = {
      prettierd = {},
      stylua = {},
    }

    local mason_tools_to_install = vim.tbl_keys(vim.tbl_deep_extend("force", {}, servers, formatters))

    require("mason-tool-installer").setup({
      auto_update = true,
      run_on_start = true,
      start_delay = 3000,
      debounce_hours = 12,
      ensure_installed = mason_tools_to_install,
    })

    -- Iterate over our servers and set them up
    for name, cfg in pairs(servers) do
      local lsp = require("lspconfig")[name]

      lsp.setup({
        cmd = cfg.cmd,
        capabilities = capabilities,
        filetypes = cfg.filetypes,
        handlers = vim.tbl_deep_extend("force", {}, default_handlers or {}, cfg.handlers or {}),
        on_attach = on_attach or function() end,
        settings = cfg.settings,
      })
    end

    -- Setup mason so it can manage 3rd party LSP servers
    require("mason").setup({
      ui = {
        border = "rounded",
      },
    })

    require("mason-lspconfig").setup()

    -- Configure borderd for LspInfo ui
    require("lspconfig.ui.windows").default_options.border = "rounded"

    -- Configure diagnostics border
    vim.diagnostic.config({
      float = {
        border = "rounded",
      },
    })
  end,
}

-- return {
--   {
--     "neovim/nvim-lspconfig",
--     event = { "BufReadPost" },
--     cmd = { "LspInfo", "LspInstall", "LspUninstall", "Mason" },
--     dependencies = {
--       -- Plugin(s) and UI to automatically install LSPs to stdpath
--       "williamboman/mason.nvim",
--       "williamboman/mason-lspconfig.nvim",
--       "WhoIsSethDaniel/mason-tool-installer.nvim",
--
--       -- Install lsp autocompletions
--       "hrsh7th/cmp-nvim-lsp",
--
--       -- Progress/Status update for LSP
--       { "j-hui/fidget.nvim", opts = {} },
--     },
--     config = function()
--       -- LSP servers and clients are able to communicate to each other what features they support.
--       --  By default, Neovim doesn't support everything that is in the LSP Specification.
--       --  When you add nvim-cmp,snip, etc. Neovim now has *more* capabilities.
--       --  So, we create new capabilities with nvim cmp, and then broadcast that to the servers.
--       local capabilities = vim.lsp.protocol.make_client_capabilities()
--       capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())
--
--       -- LSP servers to install (see list here: https://github.com/williamboman/mason-lspconfig.nvim#available-lsp-servers )
--       --  Add any additional override configuration in the following tables. Available keys are:
--       --  - cmd (table): Override the default command used to start the server
--       --  - filetypes (table): Override the default list of associated filetypes for the server
--       --  - capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
--       --  - settings (table): Override the default settings passed when initializing the server.
--       --        For example, to see the options for `lua_ls`, you could go to: https://luals.github.io/wiki/settings/
--       local servers = {
--         eslint = {
--           cmd = { "vscode-eslint-language-server", "--stdio", "--max-old-space-size=12288" },
--           settings = {
--             format = false,
--           },
--         },
--         html = {},
--         jsonls = {},
--         lua_ls = {
--           settings = {
--             Lua = {
--               runtime = { version = "LuaJIT" },
--               workspace = {
--                 checkThirdParty = false,
--                 -- Tells lua_ls where to find all the Lua files that you have loaded
--                 -- for your neovim configuration.
--                 library = {
--                   "${3rd}/luv/library",
--                   unpack(vim.api.nvim_get_runtime_file("", true)),
--                 },
--               },
--               telemetry = { enabled = false },
--             },
--           },
--         },
--         marksman = {},
--         tailwindcss = {},
--         tsserver = {
--           settings = {
--             --maxTsServerMemory = 12288,
--           },
--           handlers = {
--             --["textDocument/publishDiagnostics"] = vim.lsp.with(tsserver_on_publish_diagnostics_override, {}),
--           },
--         },
--         yamlls = {},
--       }
--
--       local formatters = {
--         prettierd = {},
--         stylua = {},
--       }
--
--       local mason_tools_to_install = vim.tbl_keys(vim.tbl_deep_extend("force", {}, servers, formatters))
--
--       require("mason-tool-installer").setup({
--         auto_update = true,
--         run_on_start = true,
--         start_delay = 3000,
--         debounce_hours = 12,
--         ensure_installed = mason_tools_to_install,
--       })
--
--       -- Iterate over our servers and set them up
--       for name, cfg in pairs(servers) do
--         local lsp = require("lspconfig")[name]
--
--         lsp.setup({
--           cmd = cfg.cmd,
--           capabilities = capabilities,
--           filetypes = cfg.filetypes,
--           handlers = vim.tbl_deep_extend("force", {}, default_handlers or {}, cfg.handlers or {}),
--           on_attach = on_attach,
--           settings = cfg.settings,
--         })
--       end
--
--       -- Setup mason so it can manage 3rd party LSP servers
--       require("mason").setup({
--         ui = {
--           border = "rounded",
--         },
--       })
--
--       require("mason-lspconfig").setup()
--
--       -- Configure borderd for LspInfo ui
--       require("lspconfig.ui.windows").default_options.border = "rounded"
--
--       -- Configure diagnostics border
--       vim.diagnostic.config({
--         float = {
--           border = "rounded",
--         },
--       })
--     end,
--   },
--   {
--     "onsails/lspkind.nvim",
--     config = function()
--       require("lspkind").init({
--         -- DEPRECATED (use mode instead): enables text annotations
--         --
--         -- default: true
--         -- with_text = true,
--
--         -- defines how annotations are shown
--         -- default: symbol
--         -- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
--         mode = "symbol_text",
--
--         -- default symbol map
--         -- can be either 'default' (requires nerd-fonts font) or
--         -- 'codicons' for codicon preset (requires vscode-codicons font)
--         --
--         -- default: 'default'
--         preset = "codicons",
--
--         -- override preset symbols
--         --
--         -- default: {}
--         symbol_map = {
--           Text = "󰉿",
--           Method = "󰆧",
--           Function = "󰊕",
--           Constructor = "",
--           Field = "󰜢",
--           Variable = "󰀫",
--           Class = "󰠱",
--           Interface = "",
--           Module = "",
--           Property = "󰜢",
--           Unit = "󰑭",
--           Value = "󰎠",
--           Enum = "",
--           Keyword = "󰌋",
--           Snippet = "",
--           Color = "󰏘",
--           File = "󰈙",
--           Reference = "󰈇",
--           Folder = "󰉋",
--           EnumMember = "",
--           Constant = "󰏿",
--           Struct = "󰙅",
--           Event = "",
--           Operator = "󰆕",
--           TypeParameter = "",
--         },
--       })
--     end,
--   },
-- }
