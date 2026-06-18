--* --------------------------------------------------------------- *--
--?                           Code Parsing                          ?--
--* --------------------------------------------------------------- *--

return {
  {
    "nvim-treesitter/nvim-treesitter",
    commit = "cf12346a3414fa1b06af75c79faebe7f76df080a", -- latest legacy-master (configs.setup API); Neovim 0.12 compat
    build = ":TSUpdate",
    cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
    dependencies = {
      { "nvim-treesitter/nvim-treesitter-textobjects", commit = "0d79d169fcd45a8da464727ac893044728f121d4" }, -- (no upstream tags; rolling master)
    },
    opts_extend = { "ensure_installed" },
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "c",
          "lua",
          "go",
          "vim",
          "vimdoc",
          "query",
          -- "javascript",
          -- "typescript",
          -- "rust",
          "dockerfile",
          "python",
          "bash",
          "hcl",
          "terraform",
          -- "rego",
          "markdown",
          "markdown_inline",
        },
        auto_install = true,
        sync_install = false,
        ignore_install = {},
        highlight = {
          enable = true,
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<C-space>",
            node_incremental = "<C-space>",
            scope_incremental = false,
            node_decremental = "<bs>",
          },
        },
        textobjects = {
          move = {
            enable = true,
            goto_next_start = { ["]f"] = "@function.outer", ["]c"] = "@class.outer", ["]a"] = "@parameter.inner" },
            goto_next_end = { ["]F"] = "@function.outer", ["]C"] = "@class.outer", ["]A"] = "@parameter.inner" },
            goto_previous_start = { ["[f"] = "@function.outer", ["[c"] = "@class.outer", ["[a"] = "@parameter.inner" },
            goto_previous_end = { ["[F"] = "@function.outer", ["[C"] = "@class.outer", ["[A"] = "@parameter.inner" },
          },
        },
      })

      -- Fix markdown (and hurl) code-block injections on Neovim 0.12+.
      -- nvim-treesitter (master) registers `set-lang-from-info-string!` with an
      -- `all=false` compat shim that 0.12 no longer honors, so the handler gets a
      -- LIST of nodes instead of one and breaks, yielding:
      --   treesitter.lua: attempt to call method 'range' (a nil value)
      -- Re-register a handler that accepts both the legacy (single node) and the
      -- 0.11+ (node list) match formats.
      pcall(require, "nvim-treesitter.query_predicates") -- ensure the plugin registers first
      local ts_query = require("vim.treesitter.query")
      local lang_aliases = { ex = "elixir", pl = "perl", sh = "bash", uxn = "uxntal", ts = "typescript" }
      ts_query.add_directive("set-lang-from-info-string!", function(match, _, bufnr, pred, metadata)
        local node = match[pred[2]]
        if type(node) == "table" then
          node = node[#node] -- Neovim 0.11+: capture maps to a list of nodes
        end
        if not node then
          return
        end
        local alias = vim.treesitter.get_node_text(node, bufnr):lower()
        metadata["injection.language"] = vim.filetype.match({ filename = "a." .. alias })
          or lang_aliases[alias]
          or alias
      end, { force = true })
    end,
  },
}
