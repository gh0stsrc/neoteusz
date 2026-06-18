--* --------------------------------------------------------------- *--
--?                     Language Server Protocol   	                ?--
--* --------------------------------------------------------------- *--

return {
  {
    -- lazydev.nvim configures LuaLS for editing your Neovim config by lazily updating
    -- workspace libraries based on `require`/`---@module` usage. Replaces the archived
    -- folke/neodev.nvim (EOL) and the manual lua_ls workspace.library runtime load.
    "folke/lazydev.nvim",
    commit = "01bc2aacd51cf9021eb19d048e70ce3dd09f7f93", -- v1.10.0
    ft = "lua",
    opts = {
      library = {
        -- load luvit types when the `vim.uv` word is found
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },
  {
    "mason-org/mason.nvim",
    commit = "2a6940af80375532e5e9e7c1f2fc6319a1b7a69d", -- v2.3.1
    config = function()
      require("mason").setup({})
    end
  },
  {
    "mason-org/mason-lspconfig.nvim",
    commit = "a5671269a1ddfa7790cdf97c14e600e269da550f", -- v2.3.0
    dependencies = {
      { "mason-org/mason.nvim" },
      { "neovim/nvim-lspconfig" },
    },
    config = function()
      require("mason-lspconfig").setup({
        -- list of language servers, debugger adapters, linters and formatters to be installed by mason and leveraged by nvim-lspconfig
        ensure_installed = {
          "lua_ls",
          "clangd",
          -- "tsserver",
          "gopls",
          -- "eslint",
          -- "rust_analyzer",
          "terraformls",
          "tflint",
          "bashls",
          "dockerls",
          -- "helm_ls",
          "pyright",
          "marksman",
          "yamlls",
        },
      })
    end
  },
  {
    "fatih/vim-go",
    commit = "f4b4ba17035aebcd222df90375c1cbb1dc4d8c5b" -- Neovim 0.12 compat (guards Windows-only 'noshellslash', E519)
  },
  {
    "neovim/nvim-lspconfig",
    commit = "229b79051b380377664edc4cbd534930154921a1", -- v2.10.0
    -- NOTE: nvim-lspconfig loads as a dependency of mason-lspconfig (below), so this config
    --       (vim.lsp.config + LspAttach + which-key) runs before mason-lspconfig's automatic_enable.
    dependencies = {
      { "folke/which-key.nvim" },
    },
    config = function()
      -- NOTE: Neovim 0.11+ native LSP. The deprecated `require('lspconfig').<server>.setup{}`
      --       framework (which called the now-removed `vim.lsp.start_client`) is replaced by
      --       `vim.lsp.config()` to customize servers; `mason-lspconfig`'s `automatic_enable`
      --       then calls `vim.lsp.enable()` for each installed server.

      -- globally configure the default capabilities for ALL LSP servers (blink.cmp autocompletion support)
      vim.lsp.config("*", {
        capabilities = require("blink.cmp").get_lsp_capabilities(),
      })

      -- lsp keymappings that are made available whenever an LSP server is attached to a buffer
      vim.api.nvim_create_autocmd('LspAttach', {
        desc = 'LSP actions',
        callback = function(event)
          local opts = { buffer = event.buf }
          vim.keymap.set("n", "<leader>ld", function() vim.lsp.buf.hover() end, opts)
          vim.keymap.set("n", "<leader>lgd", function() vim.lsp.buf.definition() end, opts)
          vim.keymap.set("n", "<leader>lgD", function() vim.lsp.buf.declaration() end, opts)
          vim.keymap.set("n", "<leader>lgi", function() vim.lsp.buf.implementation() end, opts)
          vim.keymap.set("n", "<leader>lgt", function() vim.lsp.buf.type_definition() end, opts)
          vim.keymap.set("n", "<leader>lgr", function() vim.cmd("Telescope lsp_references") end, { buffer = true })
          vim.keymap.set("n", "<leader>lcr", function() vim.lsp.buf.rename() end, opts)
          vim.keymap.set("n", "<leader>lcf", function() vim.lsp.buf.format({ async = true }) end, opts)
          vim.keymap.set("n", "<leader>lca", function() vim.lsp.buf.code_action() end, opts)
          vim.keymap.set("n", "<leader>lh<enter>", function() vim.lsp.buf.document_highlight() end, opts)
          vim.keymap.set("n", "<leader>lhc", function() vim.lsp.buf.clear_references() end, opts)
          vim.keymap.set("n", "<leader>llh", function() vim.lsp.buf.signature_help() end, opts)
          vim.keymap.set("n", "<leader>llb", function() vim.lsp.buf.document_symbol() end, opts)
          vim.keymap.set("n", "<leader>llw", function() vim.lsp.buf.workspace_symbol() end, opts)
          vim.keymap.set("n", "<leader>lri", function() vim.lsp.buf.incoming_calls() end, opts)
          vim.keymap.set("n", "<leader>lro", function() vim.lsp.buf.outgoing_calls() end, opts)
        end,
      })

      -- add keybindings to which-key in a structured manner
      require("which-key").add({
        { "<leader>l", group = "lsp", icon = { icon = "", color = "blue" } },
        { "<leader>ld", mode = "n", desc = "Documentation preview of symbol (floating)", icon = { icon = "", color = "purple" } },
        { "<leader>lg", group = "goto", icon = { icon = "⚡", } },
        { "<leader>lgd", mode = "n", desc = "Go to symbol definition" },
        { "<leader>lgD", mode = "n", desc = "Go to symbol declaration" },
        { "<leader>lgi", mode = "n", desc = "Go to symbol implementation" },
        { "<leader>lgt", mode = "n", desc = "Go to symbol type definition" },
        { "<leader>lgr", mode = "n", desc = "Go to symbol references (telescope)" },
        { "<leader>lc", group = "code", icon = { icon = "󰅩", color = "blue" } },
        { "<leader>lcr", mode = "n", desc = "Rename symbol" },
        { "<leader>lcf", mode = "n", desc = "Format code within the current buffer" },
        { "<leader>lca", mode = "n", desc = "Invoke context-aware code actions" },
        { "<leader>lh", group = "highlight", icon = { icon = "", color = "yellow" } },
        { "<leader>lh<enter>", mode = "n", desc = "Highlight all occurences of the symbol" },
        { "<leader>lhc", mode = "n", desc = "Clear all highlights" },
        { "<leader>ll", group = "list", icon = { icon = "󱘎", color = "green" } },
        { "<leader>llh", mode = "n", desc = "Display symbol signature help" },
        { "<leader>llb", mode = "n", desc = "List all buffer symbols" },
        { "<leader>llw", mode = "n", desc = "List all workspace symbols" },
        { "<leader>lr", group = "references", icon = { icon = "", color = "purple" } },
        { "<leader>lri", mode = "n", desc = "Search call sites of the symbol (incoming)" },
        { "<leader>lro", mode = "n", desc = "Search all sites called by the symbol (outgoing)" },
      })

      -- NOTE: servers that need no custom config (gopls, bashls, marksman, terraformls, tflint,
      --       dockerls, pyright, yamlls) are installed via mason-lspconfig `ensure_installed` and
      --       auto-enabled by its `automatic_enable`, using nvim-lspconfig's bundled
      --       `lsp/<server>.lua` defaults. Only servers needing customization are set below.

      -- get the absolute path of gcc on the system (using PATH)
      local gcc_path = vim.fn.exepath("gcc")
      -- if gcc exists, set gcc to be the query driver, otherwise leave it undefined
      local query_driver_flag = (gcc_path and gcc_path ~= "") and ("--query-driver=" .. gcc_path) or ""
      -- clangd config used to allow the lsp to work within a structured c project where modules are contained in respective folders
      vim.lsp.config("clangd", {
        cmd = {
          "clangd",
          "--compile-commands-dir=.",
          query_driver_flag,
        },
        root_markers = { "compile_commands.json", ".git" },
      })
      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            diagnostics = {
              -- Recognize the 'vim' global variable as valid
              globals = { "vim" },
            },
            workspace = {
              -- NOTE: lazydev.nvim now manages the workspace library dynamically (on-demand,
              -- based on `require`/`---@module` usage), replacing the slower full-runtime load.
              checkThirdParty = false, -- Optional: Avoids annoying prompts about third-party libraries
            },
            telemetry = {
              enable = false, -- Disable telemetry to not send data to the LSP server
            },
          },
        },
      })

      -- gopls v0.22.0+ only advertises semanticTokensProvider when `semanticTokens` is
      -- present in the `initialize` request's initializationOptions. Neovim's native LSP
      -- sends `settings` via didChangeConfiguration (post-init), NOT init options, so the
      -- bundled lspconfig default (settings.gopls.semanticTokens) arrives too late and gopls
      -- returns semanticTokensProvider=nil. Pass it via init_options (top-level, not nested
      -- under `gopls`) so it lands at init time. Restores @lsp.type/@lsp.typemod tokens that
      -- the const-readonly purple override and the import-path LspTokenUpdate handler rely on.
      vim.lsp.config("gopls", {
        init_options = {
          semanticTokens = true,
        },
      })

      -- Auto format on save for tf files
      vim.api.nvim_create_autocmd({ "BufWritePre" }, {
        pattern = { "*.tf", "*.tfvars" },
        callback = function()
          vim.lsp.buf.format({ async = true })
        end,
      })

      -- Keep Go import-path strings fully green.
      -- gopls emits a `namespace` semantic token over the final segment of each import
      -- path (e.g. the `manager` in "sigs.k8s.io/.../manager"). That token
      -- (@lsp.type.namespace -> gruvbox #ebdbb2) is drawn above treesitter's @string, so the
      -- package portion of the path renders white instead of green. Re-assert @string just
      -- above the semantic-token priority for any `namespace` token that lands inside a
      -- treesitter string node (i.e. an import path), so the whole string stays green.
      -- Aliases (package_identifier) and package qualifiers in code are NOT inside a string,
      -- so they keep their namespace token and remain white.
      vim.api.nvim_create_autocmd("LspTokenUpdate", {
        desc = "Override gopls namespace token inside import-path strings (keep them green)",
        callback = function(args)
          local token = args.data.token
          if token.type ~= "namespace" then
            return
          end
          local ok, captures = pcall(vim.treesitter.get_captures_at_pos, args.buf, token.line, token.start_col)
          if not ok then
            return
          end
          for _, c in ipairs(captures) do
            if c.capture == "string" or vim.startswith(c.capture, "string.") then
              vim.lsp.semantic_tokens.highlight_token(
                token, args.buf, args.data.client_id, "@string",
                { priority = vim.hl.priorities.semantic_tokens + 1 }
              )
              return
            end
          end
        end,
      })
    end,
  },
}
