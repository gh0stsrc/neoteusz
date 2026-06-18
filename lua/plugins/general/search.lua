--* --------------------------------------------------------------- *--
--?                            Searching                            ?--
--* --------------------------------------------------------------- *--

return {
  {
    "nvim-telescope/telescope.nvim",
    commit = "5255aa27c422de944791318024167ad5d40aad20", -- v0.2.2
    dependencies = {
      { "nvim-lua/plenary.nvim", commit = "74b06c6c75e4eeb3108ec01852001636d85a932b" }, -- v0.1.4 +40 (rolling master)
      { "BurntSushi/ripgrep",    commit = "7099e174acbcbd940f57e4ab4913fee4040c826e" }, -- globset-0.4.13 +54 (rolling; binary dep)
      { "sharkdp/fd",            commit = "a11f8426d4e88ccc3745cc27b700aeb5ede39013" }, -- v8.7.1 +8 (rolling; binary dep)
      { "folke/which-key.nvim" },
    },
    config = function()
      require("telescope").setup({})
      -- add group name for the root of <leader> s (i.e. search)
      require("which-key").add({
        { "<leader>s", group = "search", icon = { icon = "", color = "blue" } },
      })
    end,
    keys = {
      {
        "<leader>sf",
        function() require("telescope.builtin").find_files() end,
        mode = "n",
        desc = "Search files",
      },
      {
        "<leader>sr",
        function() require("telescope.builtin").oldfiles() end,
        mode = "n",
        desc = "Search recently opened files",
      },
      {
        "<leader>sb",
        function() require("telescope.builtin").buffers() end,
        mode = "n",
        desc = "Search existing buffers",
      },
      {
        "<leader>sh",
        function() require("telescope.builtin").help_tags() end,
        mode = "n",
        desc = "Search help",
      },
      {
        "<leader>sw",
        function() require("telescope.builtin").grep_string() end,
        mode = "n",
        desc = "Search current word",
      },
      {
        "<leader>sg",
        function() require("telescope.builtin").live_grep() end,
        mode = "n",
        desc = "Search via grep",
      },
      {
        "<leader>sd",
        function() require("telescope.builtin").diagnostics() end,
        mode = "n",
        desc = "Search diagnostics",
      },
      {
        "<leader>sF",
        function() require("telescope.builtin").current_buffer_fuzzy_find() end,
        mode = "n",
        desc = "Search current buffer (fuzzy, whole buffer)",
      },
    },
  },
  {
    "folke/flash.nvim",
    commit = "fcea7ff883235d9024dc41e638f164a450c14ca2", -- stable +28 (rolling main)
    event = "VeryLazy",
    opts = {
      modes = {
        search = {
          -- DISABLED intentionally. flash's `/`-search label integration is unreliable on
          -- Neovim 0.12.3: when the typed pattern stops matching (e.g. you type past the
          -- matches), flash leaves STALE jump labels on screen while its internal match
          -- list is already empty, so pressing a visible label does nothing and just
          -- extends the search (reproduced headlessly). Plain `/` now behaves normally.
          -- Use `<leader>f<enter>` (require("flash").jump()) for reliable label-jumping.
          enabled = false
        }
      }
    },
    config = function(_, opts)
      require("flash").setup(opts)
      -- gruvbox leaves FlashLabel's default link (`Substitute`) undefined, so flash's jump
      -- labels are invisible. Set it explicitly; reapply on ColorScheme (gruvbox clears hls).
      local function flash_hl()
        vim.api.nvim_set_hl(0, "FlashLabel", { bg = "#fb4934", fg = "#1d2021", bold = true }) -- red: jump labels
      end
      flash_hl()
      vim.api.nvim_create_autocmd("ColorScheme", { callback = flash_hl })
    end,
    keys = {
      {
        "<leader>f<enter>",
        function() require("flash").jump() end,
        mode = { "n", "x", "o" },
        desc = "Flash"
      },
      {
        "<leader>ft",
        function() require("flash").treesitter() end,
        mode = { "n", "x", "o" },
        desc = "Flash treesitter"
      },
      {
        "<leader>fT",
        function() require("flash").treesitter_search() end,
        mode = { "n", "x", "o" },
        desc = "Treesitter search"
      },
      {
        "<leader>fr",
        function() require("flash").remote() end,
        mode = "o",
        desc = "Open flash search in remote mode"
      },
      {
        "<c-s>",
        function() require("flash").toggle() end,
        mode = "c",
        desc = "Toggle flash search"
      },
    }
  },
}
