--* --------------------------------------------------------------- *--
--?                      	   Auto Completion                        ?--
--* --------------------------------------------------------------- *--

return {
  {
    "windwp/nvim-autopairs",
    commit = "23320e75953ac82e559c610bec5a90d9c6dfa743", -- 0.10.0
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup({})
    end,
  },
  {
    "saghen/blink.cmp",
    version = "1.*", -- tag pin -> downloads the matching prebuilt Rust fuzzy-matcher binary
    event = "InsertEnter",
    dependencies = {
      -- submodules=false: skip LuaSnip's optional `jsregexp` git submodule, whose relative
      -- submodule URLs fail to resolve under lazy.nvim's clone (jsregexp is only needed for
      -- advanced JS-regex snippet transforms, which this config does not use).
      { "L3MON4D3/LuaSnip", commit = "642b0c595e11608b4c18219e93b88d7637af27bc", submodules = false }, -- v2.5.0
    },
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      keymap = {
        -- start from a clean slate so the mappings below exactly replicate the prior nvim-cmp setup
        preset = "none",
        -- IMPORTANT: replicate nvim-cmp's <Tab>: accept if menu visible, else jump snippet, else fallback
        ["<Tab>"] = {
          function(cmp) if cmp.is_visible() then return cmp.select_and_accept() end end,
          "snippet_forward",
          "fallback",
        },
        ["<C-e>"] = { "hide", "fallback" },
        ["<Up>"] = { "select_prev", "fallback" },
        ["<Down>"] = { "select_next", "fallback" },
        ["<PageUp>"] = { "scroll_documentation_up", "fallback" },
        ["<PageDown>"] = { "scroll_documentation_down", "fallback" },
        -- <C-p>/<C-n>: select prev/next if menu visible, otherwise open the menu
        ["<C-p>"] = {
          function(cmp) if not cmp.is_visible() then return cmp.show() end end,
          "select_prev",
          "fallback",
        },
        ["<C-n>"] = {
          function(cmp) if not cmp.is_visible() then return cmp.show() end end,
          "select_next",
          "fallback",
        },
      },
      snippets = { preset = "luasnip" },
      sources = {
        default = { "lazydev", "lsp", "snippets", "buffer", "path" },
        providers = {
          -- lazydev.nvim completion for `require("modname")` and `---@module "modname"`
          lazydev = {
            name = "LazyDev",
            module = "lazydev.integrations.blink",
            score_offset = 100, -- top priority for require()/---@module completions
          },
        },
      },
      completion = {
        documentation = { window = { max_height = 15, max_width = 60 } },
        menu = {
          draw = {
            columns = {
              { "label", "label_description", gap = 1 },
              { "source_name" }, -- shows the source (e.g. "LSP"), replacing nvim-cmp's [LSP] menu label
              { "kind_icon", "kind" },
            },
          },
        },
        -- blink inserts function/method brackets on accept (replaces nvim-autopairs' cmp integration)
        accept = { auto_brackets = { enabled = true } },
      },
      appearance = { nerd_font_variant = "mono" },
      fuzzy = { implementation = "prefer_rust_with_warning" },
    },
    opts_extend = { "sources.default" },
  },
}
