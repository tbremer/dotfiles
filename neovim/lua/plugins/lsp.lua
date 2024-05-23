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
    -- { "j-hui/fidget.nvim", opts = {} }, -- Required. LSP progress messages

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
    local luasnip = require("luasnip")

    -- cmp setup
    cmp.setup({
      snippet = {
        expand = function(args)
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

    local map = function(bufnr, key, value, desc)
      vim.keymap.set(
        "n",
        key,
        value,
        { noremap = true, silent = true, buffer = bufnr, desc = desc or "*no description*" }
      )
    end

    local on_attach = function(_client, buf_num)
      map(buf_num, "gd", vim.lsp.buf.definition)
      map(buf_num, "gD", vim.lsp.buf.declaration)
      map(buf_num, "K", vim.lsp.buf.hover)
      -- map(buf_num, "gr", vim.lsp.buf.references)
      map(buf_num, "gs", vim.lsp.buf.signature_help)
      map(buf_num, "gi", vim.lsp.buf.implementation)
      map(buf_num, "gt", vim.lsp.buf.type_definition)
      map(buf_num, "<leader>gw", vim.lsp.buf.document_symbol)
      map(buf_num, "<leader>gW", vim.lsp.buf.workspace_symbol)
      -- map(buf_num, "<leader>ah", vim.lsp.buf.hover)

      map(buf_num, "<leader>lr", function()
        require("telescope.builtin").lsp_references()
      end, "references")
      map(buf_num, "<leader>lh", function()
        local is_enabled = vim.lsp.inlay_hint.is_enabled()

        vim.lsp.inlay_hint.enable(not is_enabled)
      end, "toggle inlay hint")
      map(buf_num, "<leader>la", vim.lsp.buf.code_action, "code actions")
      map(buf_num, "<leader>ld", function()
        vim.diagnostic.open_float({ scope = "line" })
      end, "line diagnostics")
      map(buf_num, "<leader>lD", function()
        vim.diagnostic.open_float({ scope = "buffer" })
      end, "buffer diagnostics")

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
      signs = {
        numhl = {
          [vim.diagnostic.severity.WARN] = "WarningMsg",
          [vim.diagnostic.severity.ERROR] = "ErrorMsg",
        },
      },
      float = {
        border = "rounded",
      },
    })
  end,
}
